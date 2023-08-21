package editor;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDTO;
import board.BoardService;
import jakarta.servlet.http.HttpSession;
import user.UserDTO;

@Controller
public class EditorController {
	@Autowired
	EditorService service;
	@Autowired
	BoardService board_service;
	
	@GetMapping("/editor")
	public ModelAndView editor(@RequestParam(name="bi", required=false, defaultValue = "none") String bi, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(bi.equals("none")) {
			//새글작성폼
			mv.setViewName("editor/editor");
		}else {
			BoardDTO board = board_service.boardDetail(bi);
			String CurrentUser = (String)session.getAttribute("user_id");
			
			if(board.getUser_id().equals(CurrentUser)) {
				//내 템플릿일때 board 가져오기
				board.setCodes(board.getCodes().replaceAll("<br>", "</div><div>"));
				mv.addObject("board", board);
				mv.setViewName("editor/editorUpdate");
			}else {
				//다른사람 템플릿일때 code만가져오기
				String codes = board.getCodes();
				codes = codes.replaceAll("<br>", "</div><div>");
				mv.addObject("codes", codes);
				mv.setViewName("editor/editor");
			}
		}
		
		//유저가 로그인되어있는 경우
		String user_id = (String) session.getAttribute("user_id");
		if(user_id != null) {
			UserDTO loginuser = service.getLoginUser(user_id);
			mv.addObject("user_git_id", loginuser.getGit_id());
		}
		return mv;
	}
	
	@PostMapping("/getbadges")
	@ResponseBody
	public List<BadgeDTO> getbadges(String keyword){
		List<BadgeDTO> list = service.getBadges(keyword);
		return list;
	}

	@PostMapping("/getstatstheme")
	@ResponseBody
	public List<StatsThemeDTO> getStatsThemes(String keyword){
		List<StatsThemeDTO> list = service.getStatsThemes(keyword);
		return list;
	}

	@PostMapping("/gethits")
	@ResponseBody
	public List<HitDTO> gethits(String keyword){
		List<HitDTO> list = service.getHits(keyword);
		return list;
	}
	
	@PostMapping("/savecodes")
	@ResponseBody
	public String saveCodes(BoardDTO dto) {
		String new_id = UUID.randomUUID().toString();
		while(service.isBoardIdExist(new_id)) {	new_id = UUID.randomUUID().toString();	}
		dto.setBoard_id(new_id);
		//이전에 저장안된 게시물 지우기
		service.deleteNoSaveBoard(dto.getUser_id());
		//신규게시물 등록
		board_service.first_insert_board(dto);
		return "{\"board_id\":\""+dto.getBoard_id()+"\"}";
	}
	

	@PostMapping("/updatecodes")
	@ResponseBody
	public String updatecodes(BoardDTO dto) {
		board_service.first_update_board(dto);
		return "{\"board_id\":\""+dto.getBoard_id()+"\"}";
	}
	
	
	
}
