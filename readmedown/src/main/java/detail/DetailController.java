package detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.BookmarkDTO;
import jakarta.servlet.http.HttpSession;
import main.MainService;



@Controller
public class DetailController {
	@Autowired
	DetailService service;
    MainService service2;
	
	@RequestMapping("/detail")
	public ModelAndView detail( HttpSession session,  @RequestParam("bi") String board_id) {
		
		
		  String user_id = (String) session.getAttribute("user_id");
			System.out.println(board_id);
			System.out.println(user_id);
			DetailDTO dto = service.detail(board_id);	
			BookmarkDTO bmdto = new BookmarkDTO();
			bmdto.setBoard_id(dto.getBoard_id());
			bmdto.setUser_id(user_id);
			int bookmarkcnt = service.isDBookmarked(bmdto);
			if(bookmarkcnt != 0) {
				dto.setBookmarked(true);
			}
			else {
				dto.setBookmarked(false);
			}
			
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("dto", dto);
			mv.setViewName("detail/detail");
			return mv;	
	
	}//상세페이지 조회
	//북마크 추가
		@RequestMapping(value="/addDBookmark", produces = {"application/json;charset=utf-8"})
		public @ResponseBody int addDBookmark (String board_id, HttpSession session) {
			String userId = (String)session.getAttribute("user_id");
			BookmarkDTO dto = new BookmarkDTO();
			dto.setBoard_id(board_id);
			dto.setUser_id(userId);
			int DBookmarkExist = service.isDBookmarked(dto);
			int result;
			if(DBookmarkExist == 0) {
				result = service.addDBookmark(dto);
			}
			else {
				result = -1;
			}		
			return result;
		}
		
		//북마크 삭제
		@RequestMapping(value="/deleteDBookmark", produces = {"application/json;charset=utf-8"})
		public @ResponseBody int deleteDBookmark (String board_id, HttpSession session) {
			String userId = (String)session.getAttribute("user_id");
			BookmarkDTO dto = new BookmarkDTO();
			dto.setBoard_id(board_id);
			dto.setUser_id(userId);
			int DBookmarkExist = service.isDBookmarked(dto);
			int result;
			if(DBookmarkExist > 0) {
				result = service.deleteDBookmark(dto);
			}
			else {
				result = -1;
			}		
			return result;
		}}
		

	







