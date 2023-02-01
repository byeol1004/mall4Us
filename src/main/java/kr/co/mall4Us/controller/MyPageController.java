package kr.co.mall4Us.controller;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mall4Us.service.CartService;
import kr.co.mall4Us.service.CouponService;
import kr.co.mall4Us.service.InquiryService;
import kr.co.mall4Us.service.InventoryService;
import kr.co.mall4Us.service.MemberService;
import kr.co.mall4Us.service.ProductsService;
import kr.co.mall4Us.service.ReviewService;
import kr.co.mall4Us.vo.CouponVO;
import kr.co.mall4Us.vo.MemberVO;
import kr.co.mall4Us.vo.ProductsVO;
import kr.co.mall4Us.vo.ReviewVO;

@Controller
@RequestMapping("/myPage/")
public class MyPageController {

	@Autowired
	MemberService service;

	@Autowired
	ProductsService pservice;
	
	@Autowired
	InquiryService inService;
	
	@Autowired
	InventoryService iService;
	
	@Autowired
	ReviewService reService;
	
	@Autowired
	CartService caService;
	
	@Autowired
	CouponService cpservice;
	
	@RequestMapping("/memberJoinProc") 
	public String addMember(String memId, MemberVO vo, Model model, HttpSession session, HttpServletRequest request) {

//		CouponVO coupon = cpservice.getCoupon(memId);
//		session.setAttribute("coupon", coupon);
		
		int result = service.addMember(vo);
		if(result == 1) {
			session.setAttribute("vo", vo);
			if(vo != null) {
				cpservice.initCoupon(vo.getMemId());
			}
		}
//		String referer = request.getHeader("Referer"); // getHeader의 내용을 Referer로 가져와서 redirect로 반환 > 로그인 후 바로 이전페이지로 되돌아가기 
//		return "redirect:"+ referer;
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
		
		if(update == 1) {
			session.setAttribute("vo", vo);
		}
		return "/myPage/memberModify";
	}
	
	@RequestMapping("/memberModify")
	public String memberModify() {
		return "/myPage/memberModify";
	}
	
	@RequestMapping("/orderList")
	public String myPageOderList() {
		return "/myPage/orderList";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		return "/myPage/orderDetail";
	}
	
	
	
	@RequestMapping("/myPage")
	public String myPageList(String memId, Model model, HttpSession session) {
		
		System.out.println("===========================");
		model.addAttribute("message","최근 조회된 상품이 없습니다");
		if(session.getAttribute("recentlyView")!=null) {
		
			long[] views = (long[]) session.getAttribute("recentlyView");
			for(long view : views) {
				System.out.println(view);
				
			}
			List<ProductsVO> recentlyViews = new ArrayList<ProductsVO>();
		
			for(long view : views) {
				
				if(view !=0) {
					ProductsVO vo = pservice.getOne(view);
					recentlyViews.add(vo);
				}
			}
		model.addAttribute("recentlyViews", recentlyViews);
		model.addAttribute("message","");
		}
		
//		Long amount = (Long)session.getAttribute("amount");
		CouponVO coupon = cpservice.getCoupon(memId);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("status", 1);
			
		List<Map<String,Object>> list = caService.getCartListByMemId(map);
		for(Map<String, Object> vo:list) {
//			System.out.println("@@@@@@@@@@@@@"+vo);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("coupon",coupon);
		
		return "/myPage/myPage";
	}
	
	@RequestMapping("/reviewWriteProc")
	public String reviewWriteProc(long prodId, Model model) {
//		System.out.println("prodId"+prodId);
//		ProductsVO prodInfo = pservice.getOne(prodId);
		model.addAttribute("prodId",prodId);
		
		return "/myPage/reviewWrite";
	}
	
	@RequestMapping("/reviewWrite")
	public String reviewWrite(ReviewVO review, Model model) {
		System.out.println("review"+review);
		long prodId = review.getProdId();
		ProductsVO prodInfo = pservice.getOne(prodId);
		model.addAttribute("prodInfo", prodInfo);
		
		
		int result = reService.addReview(review);
		if(result == 1) {
			model.addAttribute("review", review);
		}
		
		List<ReviewVO> reviewList = reService.getReviewByProdId(prodId);
		model.addAttribute("reviewList", reviewList);
		
		return "/products/detail";
	}
	
	
	@RequestMapping("/reviewList")
	public String reviewList() {
		return "/myPage/reviewList";
	}
	
	
	/*	@RequestMapping("/login")
	public String login(String memId, String memPwd, HttpSession session) {
		MemberVO vo = service.getOneMember(memId, memPwd);
//		System.out.println("===");
		if( vo == null) return "/login/loginFail";
		session.setAttribute("vo", vo);
		return "/myPage/myPage";
	
	}*/
}
