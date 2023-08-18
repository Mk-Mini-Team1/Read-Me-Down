package main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import board.BoardService;
import board.BookmarkDTO;
import jakarta.servlet.http.HttpSession;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
//	@GetMapping("/")
//	public String main() {
//		return "main";
//	}
  
	@GetMapping("/test")
	public String test() {
		return "masonryTest";
	}
	
	//메인 글 목록 불러오기
	@RequestMapping("/")
	public ModelAndView allBoardList(@RequestParam(value="page", required=false, defaultValue="1" ) int page, HttpSession session) {
		session.setAttribute("user_id", "dkslwn");
		//글 목록
		SearchDTO searchdto = new SearchDTO();
	    searchdto.setRecordSize(100);
	    searchdto.setPage(page);
	    System.out.println("========================================= page = " + page);
		PagingResponse<BoardDTO> list = service.allBoardList(searchdto);
		
		//사용자 북마크 목록
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("user_id") == null) {
			mv.addObject("searchdto", searchdto);
			mv.addObject("response", list);
		}
		else {
			String userId = (String)session.getAttribute("user_id");
			for(BoardDTO b : list.getList()) {
				BookmarkDTO bmdto = new BookmarkDTO();
				bmdto.setBoard_id(b.getBoard_id());
				bmdto.setUser_id(userId);
				int bookmarkcnt = service.isBookmarked(bmdto);
				if(bookmarkcnt != 0) {
					b.setBookmarked(true);
				}
				else {
					b.setBookmarked(false);
				}
			}//for
			mv.addObject("searchdto", searchdto);
			mv.addObject("response", list);
		}
		mv.setViewName("main");
		return mv;
	}	
	
}//class
