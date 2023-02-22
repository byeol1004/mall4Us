package kr.co.mall4Us.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mall4Us.service.CouponService;
import kr.co.mall4Us.service.MemberService;
import kr.co.mall4Us.vo.CouponVO;
import kr.co.mall4Us.vo.MemberVO;

@Controller
@RequestMapping("/login/")
public class LoginController {

	@Autowired
	MemberService service;
	
	@Autowired
	CouponService cpservice;
	
	@RequestMapping("/login")
	public String login(String memId, String memPwd, HttpServletRequest request, HttpSession session, Model model) {
		  
		MemberVO vo = service.getOneMember(memId, memPwd);
		System.out.println("=&*&^*===vo=="+vo);
		session.setAttribute("vo", vo);
//		session.setMaxInactiveInterval(180*60);
		session.setAttribute("flag", 1);
		
		CouponVO coupon = cpservice.getCoupon(memId);
		session.setAttribute("coupon", coupon);
		System.out.println("=&*&^*==coupon"+coupon);
		
		String referer = request.getHeader("Referer"); // getHeader의 내용을 Referer로 가져와서 redirect로 반환 > 로그인 후 바로 이전페이지로 되돌아가기 
		return "redirect:"+ referer;

	}

		
		
	
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		request.getSession().invalidate();
//		String referer = request.getHeader("Referer");
//		System.out.println(referer);		
		return "redirect:home";
	}
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/login/loginForm";
	}
	@RequestMapping("/loginFail")
	public String loginFail() {
		return "/login/loginFail";
	}
	
	
	@RequestMapping("/home")
	public String mainhome() {
		return "home";
	}
}
