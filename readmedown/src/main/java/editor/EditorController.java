package editor;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.BoardDTO;
import board.BoardService;
import jakarta.servlet.http.HttpSession;

@Controller
public class EditorController {
	@Autowired
	EditorService service;
	@Autowired
	BoardService board_service;
	
	@GetMapping("/editor")
	public String editor(HttpSession session) {
		/* session.setAttribute("user_id", "dkssud"); */
		return "editor/editor";
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
	
	@PostMapping("/savecodes")
	@ResponseBody
	public String saveCodes(BoardDTO dto) {
		String new_id = UUID.randomUUID().toString();
		while(service.isBoardIdExist(new_id)) {
			new_id = UUID.randomUUID().toString();
		}
		dto.setBoard_id(new_id);
		board_service.first_insert_board(dto);
		return "{\"board_id\":\""+dto.getBoard_id()+"\"}";
	}
	
	
	
}
