package main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String main() {
		return "main";
	}
  
	@GetMapping("/test")
	public String test() {
		return "masonryTest";

	@GetMapping("/signup")
	public String test() {
		return "sign/signUp";
	}
}
