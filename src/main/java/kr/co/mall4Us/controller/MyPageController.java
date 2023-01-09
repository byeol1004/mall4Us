package kr.co.mall4Us.controller;

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
@RequestMapping("/myPage/")
public class MyPageController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/login")
	public String login(String memId, String memPwd, HttpSession session) {
		MemberVO vo = service.getOneMember(memId, memPwd);
//		System.out.println("===");
		if( vo == null) return "/login/loginFail";
		session.setAttribute("vo", vo);
		return "/myPage/myPage";
	
	}
	
	@GetMapping("/memberJoin") 
	public String addMemberForm() {
		return "/myPage/memberJoin"; 
	}

	@RequestMapping("/memberJoinProc") 
	public String addMember(MemberVO vo, Model model, HttpSession session ) {
		int result = service.addMember(vo);
		if(result == 1) {
			session.setAttribute("vo", vo);
		}
		return "home";
	}
	
	@RequestMapping("/memberModifyProc")
	public String memberModify(HttpServletRequest request, HttpSession session) {
		
		MemberVO vo = new MemberVO();
		vo.setMemId(request.getParameter("memId"));
		vo.setMemName(request.getParameter("memName"));
		vo.setMemPwd(request.getParameter("memPwd"));
		vo.setMemLivingArea(request.getParameter("memLivingArea"));
		vo.setMemAddress(request.getParameter("memAddress"));
		vo.setMemPhone(request.getParameter("memPhone"));
	
		
		int update = service.updateMember(vo);
		session.setAttribute("update", update);
		return "/myPage/memberModify";
	}
	
/*	@RequestMapping("/memberDelete")
	public String memberDelete(String memId, HttpSession session ) {
		int result = service.delMember(memId);
		if(result == 1) {
			session.setAttribute(memId, result);
		}
		return "home";
	}
*/	
	
	
	@RequestMapping("/myPage")
	public String myPageList() {
		return "/myPage/myPage";
	}
	
	@RequestMapping("/orderList")
	public String myPageOderList() {
		return "/myPage/orderList";
	}
	@RequestMapping("/memberModify")
	public String memberModify() {
		return "/myPage/memberModify";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		return "/myPage/orderDetail";
	}
	
	@RequestMapping("/reviewWrite")
	public String reviewWrite() {
		return "/myPage/reviewWrite";
	}
	
	@RequestMapping("/reviewList")
	public String reviewList() {
		return "/myPage/reviewList";
	}
}
