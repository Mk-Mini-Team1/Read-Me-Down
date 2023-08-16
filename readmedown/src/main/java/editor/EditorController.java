package editor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EditorController {
	@Autowired
	EditorService service;
	
	@GetMapping("/editor")
	public String editor() {
		return "editor/editor";
	}
	
	@PostMapping("/getbadges")
	@ResponseBody
	public List<BadgeDTO> getbadges(String keyword){
		List<BadgeDTO> list = service.getBadges(keyword);
		return list;
	}
}
