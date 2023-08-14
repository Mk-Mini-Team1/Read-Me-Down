package user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/signup")
	public String signUp() {
		return "sign/signUp";
	}
	
	@GetMapping("/signin")
	public String signin() {
		return "sign/signIn";
	}
	
	@GetMapping("/findpw")
	public String findpassword() {
		return "sign/findPw";
	}
}
