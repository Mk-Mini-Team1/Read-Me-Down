package detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;



@Controller
public class DetailController {
	@Autowired
	DetailService service;
	
	@RequestMapping("/detail")
	public ModelAndView detail( HttpSession session, String board_id) {
		session.setAttribute("user_id", "user123");
		
		  String user_id = (String) session.getAttribute("user_id");
			System.out.println(board_id);
			System.out.println(user_id);
			DetailDTO dto = service.detail(board_id);
			ModelAndView mv = new ModelAndView();
			mv.addObject("dto", dto);
			mv.setViewName("detail/detail");
			return mv;	
		
		
		
	
	}
}
