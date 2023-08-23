package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmailController {
	@Autowired
	EmailService service;
	// 이메일 보내기
	@PostMapping("/sendemail")
	@ResponseBody
	public int sendEmail(@RequestParam("email") String email) {
	    return service.sendEmail(email);
	}

}