package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import board.BookmarkDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import main.MainService;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

@Controller
public class FollowController {
	@Autowired
	@Qualifier("mypageServiceImpl")
	MypageService service;
	@Autowired
	FollowService follow_service;
	@Autowired
	MainService main_service;
	
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

	@PostMapping("/deletefollowdto")
	@ResponseBody
	public String deletefollowdto(FollowDTO dto) {
		int result = follow_service.deleteFollowdto(dto);
		return "{\"result\":\""+result+"\"}";
	}

	@PostMapping("/insertfollowdto")
	@ResponseBody
	public String insertfollowdto(FollowDTO dto) {
		int result = follow_service.insertFollowdto(dto);
		return "{\"result\":\""+result+"\"}";
	}
	
	@GetMapping("/usermain")
	public ModelAndView userMain(String ui, HttpSession session, @RequestParam(name = "page", required = false, defaultValue = "1")int page) {
		String userId = session.getAttribute("user_id").toString();
		
		UserDTO otherInfo = follow_service.getOtherUserInfo(ui);
		int followerCnt = follow_service.getFollowerCnt(ui);
		//팔로잉여부검사
		FollowDTO follow = new FollowDTO();
		follow.setMy_id(userId);
		follow.setYour_id(ui);
		boolean isfollowing = follow_service.isFollowing(follow);
		
		SearchDTO searchdto = new SearchDTO();
		searchdto.setSearchType1(ui);
		searchdto.setPage(page);
		//작성한 글 불러오기
		PagingResponse<BoardDTO> list = follow_service.getOtherUserBoards(searchdto);
		//해당유저 작성글 중 북마크여부 검사
		for(BoardDTO b : list.getList()) {
			BookmarkDTO bmdto = new BookmarkDTO();
			bmdto.setBoard_id(b.getBoard_id());
			bmdto.setUser_id(userId);
			int bookmarkcnt = main_service.isBookmarked(bmdto);
			if(bookmarkcnt != 0) {b.setBookmarked(true);}
			else {b.setBookmarked(false);}
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("otherInfo", otherInfo);
		mv.addObject("followerCnt", followerCnt);
		mv.addObject("isfollowing", isfollowing);
		mv.addObject("response", list);
		mv.setViewName("/userMain");
		return mv;
	}
	
	

}
