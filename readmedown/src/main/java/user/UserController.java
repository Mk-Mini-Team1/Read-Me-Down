package user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userServiceImpl")
    UserService service;

    @GetMapping("/signup")
    public ModelAndView getSignUp(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        if (session.getAttribute("user_id") != null) {
            mv.setViewName("redirect:/");
        } else {
            mv.setViewName("sign/signUp");
        }

        return mv;
    }

    @PostMapping("/signup")
    public ModelAndView signUp(UserDTO userDTO) {
        service.insertUser(userDTO);

        return new ModelAndView("redirect:/");
    }
    
	@PostMapping("/checkemail")
	@ResponseBody
	public int checkEmail(String email) {
		int count = service.checkEmail(email);

		return count;
	}

	
	

    @GetMapping("/signin")
    public ModelAndView getSignIn(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        session.setAttribute("error_message", "");

        if (session.getAttribute("user_id") != null) {
            mv.setViewName("redirect:/");
        } else {
            mv.setViewName("sign/signIn");
        }

        return mv;
    }

    @PostMapping("/signin") // POST 요청 처리
    @ResponseBody
    public Map<String, Object> signInPost(@RequestParam String email, @RequestParam String password, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        UserDTO dto = service.loginUser(email);

        if (dto != null) {
            if (dto.getPassword().equals(password)) {
                if (dto.getDeleted_date() == null) {
                    session.setAttribute("user_id", dto.getUser_id());
                    session.setAttribute("user_profile", dto.getProfile_image());
                    result.put("success", true); // 로그인 성공
                } else {
                    result.put("success", false);
                    result.put("errorMessage", "로그인이 불가한 이메일입니다."); //탈퇴한 아이디
                }
            } else {
                result.put("success", false);
                result.put("errorMessage", "비밀번호를 확인해 주세요");
            }
        } else {
            result.put("success", false);
            result.put("errorMessage", "등록되지 않은 이메일 입니다");
        }
        return result;
    }    
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        if (session.getAttribute("user_id") != null) {
            session.removeAttribute("user_id");
        }
        return "redirect:/"; // 루트 경로로 리다이렉트
    }


    
    
    

	@GetMapping("/findpw")
	public String findPassword() {
		return "sign/findPw";
	}
	
	@GetMapping("/usermain")
	public String userMain() {
		return "/userMain";
	}
}
