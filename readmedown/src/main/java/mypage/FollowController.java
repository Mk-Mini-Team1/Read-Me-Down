package mypage;

import java.util.List;

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
public class FollowController {
	@Autowired
	@Qualifier("mypageServiceImpl")
	MypageService service;

	@Autowired
	FollowService follow_service;
	
	@GetMapping("/following")
	public ModelAndView followingList(HttpSession session) {
	    ModelAndView mv = new ModelAndView();
	    if (session.getAttribute("user_id") != null) {
	    	String user_id = session.getAttribute("user_id").toString();
	    	MypageDTO my_info = service.userInfo(user_id); // service 사용
	    	List<FollowDTO> followList = follow_service.getFollowList(user_id);
	    	
	    	mv.addObject("info", my_info);
	    	mv.addObject("followList", followList);
	        mv.setViewName("mypage/followingList"); // 로그인된 경우 마이페이지로 이동
	    } else {
	        mv.setViewName("redirect:/"); // 로그인되지 않은 경우 로그인 페이지로 이동
	    }
	    return mv;
	}
	
	@PostMapping("/deletefollow")
	@ResponseBody
	public String deletefollow(String follow_id) {
		int result = follow_service.deleteFollow(follow_id);
		return "{\"result\":\""+result+"\"}";
	}
	
	

}
