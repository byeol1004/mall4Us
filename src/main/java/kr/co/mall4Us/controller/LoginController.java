package kr.co.mall4Us.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall4Us.service.MemberService;
import kr.co.mall4Us.vo.MemberVO;

@Controller
@RequestMapping("/login/")
public class LoginController {

	@Autowired
	MemberService service;
	
/*	@RequestMapping("login")
	public String login() {
		return "/member/login";
	}
*/	
	@RequestMapping("/login")
	public String login(String memId, String memPwd, Model model, HttpServletRequest request, HttpSession session) {

		MemberVO vo = service.getOneMember(memId, memPwd);

		if( vo == null) model.addAttribute("message", "로그인에 실패하였습니다!");
		session.setAttribute("vo", vo);
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	
	
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "/home";
	}
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/login/loginForm";
	}
	@RequestMapping("/loginFail")
	public String loginFail() {
		return "/login/loginFail";
	}
	/*	
	@GetMapping("/memberJoin") 
	public String addMemberForm() {
		return "/member/memberJoin"; 
	}

	@RequestMapping("/memberJoinProc") 
	public String addMember(MemberVO vo, Model model, HttpSession session ) {
		int result = service.addMember(vo);
		if(result == 1) {
			session.setAttribute("vo", vo);
		}
		return "home";
	} */
}
