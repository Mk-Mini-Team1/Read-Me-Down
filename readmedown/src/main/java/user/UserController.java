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
	public String signIn() {
		return "sign/signIn";
	}
	
	@GetMapping("/findpw")
	public String findPassword() {
		return "sign/findPw";
	}
	
	@GetMapping("/usermain")
	public String userMain() {
		return "/userMain";
	}
}
