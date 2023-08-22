package detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import board.BookmarkDTO;
import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;
import main.MainService;
import user.UserDTO;



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
			UserDTO userdto = service.detailuser(user_id);
			UserDTO boardUser = service.getUserInfoByBoardId(board_id);
			
			List<CommentDTO> commentdtoList = service.comment(board_id); // 댓글 목록을 리스트로 가져옴

			// 각 댓글의 작성자 정보를 가져와서 CommentDTO에 설정
			 for (CommentDTO comment : commentdtoList) {
			        UserDTO commentUser = service.getCommentUserByWriter(comment.getComment_writer());
			        comment.setUser(commentUser); // Set the user information for the comment
			    }
		   
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
			mv.addObject("commentdto", commentdtoList);
			mv.addObject("userdto", userdto);
			mv.addObject("boardUser", boardUser);
			mv.setViewName("detail/detail");
			return mv;	
	
	}//상세페이지 조회
	
	//댓글 작성
	@RequestMapping("/addComment")
	public ResponseEntity<Integer> insertcomment(HttpSession session, BoardDTO dto, CommentDTO comment, Model model) {
		if (session.getAttribute("user_id") != null ) {
			String user_id = session.getAttribute("user_id").toString();
			dto.setUser_id(user_id);
		}
		int comment_id = service.insertcomment(comment);; // 새로 생성된 seq를 얻어옵니다.
			
		return new ResponseEntity<Integer>(comment_id, HttpStatus.OK);
			}
	
	
	
	
	@PostMapping("/deleteBoard")
	public ResponseEntity<String> deleteBoard(String board_id) {
	    DetailDTO dto = new DetailDTO();
	    dto.setBoard_id(board_id); // dto에 board_id 설정
	    service.deleteBoard(dto); // deleteBoard 메서드 호출

	    return ResponseEntity.ok("Board deleted successfully");
	}


	
	
	@PostMapping("/deletecomment")
	public ResponseEntity<String> deletecomment(int comment_id) {
	    CommentDTO dto = new CommentDTO();
	    dto.setComment_id(comment_id); // dto에 board_id 설정
	    service.deletecomment(dto); // deleteBoard 메서드 호출

	    return ResponseEntity.ok("Board deleted successfully");
	}
	
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
		}
}





