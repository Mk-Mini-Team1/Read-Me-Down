package mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import board.BookmarkDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	MypageService service;
	
	
	@GetMapping("/mypage")
	public ModelAndView myTemplates(HttpSession session, @ModelAttribute SearchDTO searchDTO) {
	    ModelAndView mv = new ModelAndView();

	    if (session.getAttribute("user_id") != null) {
	        String user_id = session.getAttribute("user_id").toString();

	        
	        // 사용자의 템플릿 목록 가져오기
	        searchDTO.setRecordSize(10);
	        PagingResponse<BoardDTO> userTemplates = service.allTemplatesList(searchDTO);
	        MypageDTO my_info = service.userInfo(user_id);
	        
	      
	        mv.addObject("info", my_info);	        
	        mv.addObject("searchdto", searchDTO);
			mv.addObject("response", userTemplates);
			mv.setViewName("mypage/myPage");
	    } else {
	        mv.setViewName("redirect:/"); // 로그인되지 않은 경우 로그인 페이지로 이동
	    }

	    return mv;
	}

	

	
	@GetMapping("/bookmarks")
	public ModelAndView myBookmarks(HttpSession session, @ModelAttribute SearchDTO searchDTO) {
	    ModelAndView mv = new ModelAndView();
	    
	    if (session.getAttribute("user_id") != null) {
	    	String user_id = session.getAttribute("user_id").toString();
	    	
	    	searchDTO.setRecordSize(10);
	        PagingResponse<BoardDTO> userBookmarks = service.allBookmarksList(searchDTO);
	    	MypageDTO my_info = service.userInfo(user_id); // service 사용
	    	
	    	mv.addObject("info", my_info);
	    	mv.addObject("searchdto", searchDTO);
	    	mv.addObject("response", userBookmarks);
	        mv.setViewName("mypage/bookmarkList"); // 로그인된 경우 마이페이지로 이동
	    } else {
	        mv.setViewName("redirect:/"); // 로그인되지 않은 경우 로그인 페이지로 이동
	    }
	    
	    return mv;
	}
	
	
	@GetMapping("/following")
	public ModelAndView followingList(HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    
	    if (session.getAttribute("user_id") != null) {
	    	String user_id = session.getAttribute("user_id").toString();
	    	MypageDTO my_info = service.userInfo(user_id); // service 사용
	    	
	    	mv.addObject("info", my_info);
	        mv.setViewName("mypage/followingList"); // 로그인된 경우 마이페이지로 이동
	    } else {
	        mv.setViewName("redirect:/"); // 로그인되지 않은 경우 로그인 페이지로 이동
	    }
	    
	    return mv;
	}

	
	@RequestMapping("/mypage/edit")
	public ModelAndView editUser(HttpSession session, HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    if (session.getAttribute("user_id") != null) {
	        String user_id = session.getAttribute("user_id").toString();
	        MypageDTO my_info = service.userInfo(user_id); // service 사용

	        mv.addObject("info", my_info);
	        mv.setViewName("mypage/editProfile");
	    } else {
	        request.setAttribute("msg", "로그인 후 이용가능합니다.");
	        request.setAttribute("url", "/");
	        mv.setViewName("alert");
	    }

	    return mv;
	}
	
	@ResponseBody
    @PostMapping("/updateuser")
    public String updateUser(HttpSession session, String name, String password, String edit_password, 
                             String profile_image, String git_id) {
        if (session.getAttribute("user_id") != null) {
            String user_id = session.getAttribute("user_id").toString();
            String checkPw = service.checkPw(user_id);

            if (password.equals(checkPw)) {
                service.updateUser(user_id, name, profile_image, git_id);
                session.setAttribute("user_profile", profile_image);

                if (!edit_password.equals("")) {	                    
                    service.updatePw(edit_password, user_id);	                    
                }
            } else {
                return "{\"response\" :  \"현재 비밀번호를 입력해주세요.\"}";
            }
        }

        return "{\"response\" :  \"수정이 완료되었습니다.\"}";
    }


}
