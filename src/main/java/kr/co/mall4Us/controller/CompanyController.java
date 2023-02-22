package kr.co.mall4Us.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/")
public class CompanyController {
	
	@RequestMapping("/qAnda")
	public String pAnda() {
		System.out.println("컴패니");
		return "/qAndaAbout/qAnda";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "/qAndaAbout/about";
	}
}
