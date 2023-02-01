package kr.co.mall4Us.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mall4Us.service.CartService;
import kr.co.mall4Us.service.CouponService;
import kr.co.mall4Us.service.InquiryService;
import kr.co.mall4Us.service.InventoryService;
import kr.co.mall4Us.service.MemberService;
import kr.co.mall4Us.service.ProductsService;
import kr.co.mall4Us.service.ReviewService;
import kr.co.mall4Us.vo.CartVO;
import kr.co.mall4Us.vo.CouponVO;
import kr.co.mall4Us.vo.InventoryVO;
import kr.co.mall4Us.vo.ProductsVO;
import kr.co.mall4Us.vo.ReviewVO;

@Controller
@RequestMapping("/products/")
public class ProductsController {
	
	@Autowired
	ProductsService service;
	
	@Autowired
	InquiryService inService;
	
	@Autowired
	InventoryService iService;
	
	@Autowired
	ReviewService reService;
	
	@Autowired
	MemberService memService;
	
	@Autowired
	CartService caService;
	
	@Autowired
	CouponService cpservice;
	
	
	//search값 보내기
		@RequestMapping("/search")	
		@ResponseBody
		public String search(String prodName, Model model, HttpSession session) {	
//			System.out.println("@@@prodName"+prodName);
			
			List<ProductsVO> list = service.getAll(prodName);
			for(ProductsVO vo:list) {
//				System.out.println("들어왔니?"+vo);
			};

			session.setAttribute("list", list);
			return "redirect:/products/productSearch";
		}
		
		@RequestMapping("/productSearch")
		public String productSearch() {
			
			return "/products/productsList";
		}
	
		@RequestMapping("/productsList")
		public String productsList( HttpSession session,
										 String prodHiClass,
										 String prodMiClass, 
										 String prodLoClass) {
			
			session.setAttribute("prodHiClass", prodHiClass);
			session.setAttribute("prodMiClass", prodMiClass);
			session.setAttribute("prodLoClass", prodLoClass);
			
			Map<String, String> map = new HashMap<String, String>();
			  map.put("prodHiClass", prodHiClass); 
			  map.put("prodMiClass", prodMiClass);
			  map.put("prodLoClass", prodLoClass);
			
			List<ProductsVO> list = service.getCategory(map);
			session.setAttribute("list", list);
					 
			return "/products/productsList";
		}
		
		@RequestMapping("/sort")
		@ResponseBody
		public String sort( HttpSession session, Model model, String sortMethod, String prodHiClass, 
												String prodMiClass,
												String prodLoClass) {
			session.setAttribute("prodHiClass", prodHiClass);
			session.setAttribute("prodMiClass", prodMiClass);
			session.setAttribute("prodLoClass", prodLoClass);

			if(sortMethod.equals("priceAsc") ) {
				
				Map<String, String> map = new HashMap<String, String>();
				  map.put("prodHiClass", null);

			         if (prodHiClass != "") {
			            map.put("prodHiClass", prodHiClass);
			         }

			      map.put("prodMiClass", null);

			         if (prodMiClass != "") {
			            map.put("prodMiClass", prodMiClass);
			         }
			   
			      map.put("prodLoClass", null);
			   
			         if (prodLoClass != "") {
			      map.put("prodLoClass", prodLoClass);
			         }
				  
				 List<ProductsVO> list= inService.productsSearchByPriceAsc(map);
				 System.out.println("가격낮은순"+list);
					session.setAttribute("list", list);
			}else if(sortMethod.equals("priceDesc")){
				Map<String, String> map = new HashMap<String, String>();
				  map.put("prodHiClass", null);

			         if (prodHiClass != "") {
			            map.put("prodHiClass", prodHiClass);
			         }

			      map.put("prodMiClass", null);

			         if (prodMiClass != "") {
			            map.put("prodMiClass", prodMiClass);
			         }
			   
			      map.put("prodLoClass", null);
			   
			         if (prodLoClass != "") {
			      map.put("prodLoClass", prodLoClass);
			         }
			  List<ProductsVO> list= inService.productsSearchByPriceDesc(map);
			 System.out.println("가격높은순"+list);
			 session.setAttribute("list", list);
			 
			}else if(sortMethod.equals("soldDesc")){
				
				List<Map<String, Object>> listBySold = caService.getProductBySold();
				List<ProductsVO> list = new ArrayList<ProductsVO>();
				
				for(Map<String, Object>item : listBySold) {
					long prodId= Long.parseLong(String.valueOf(item.get("PRODID")));
				
				ProductsVO vo = service.getOne(prodId);
				list.add(vo);
			
				System.out.println("판매높은순"+list);
				session.setAttribute("list", list);
					 
				}
			
			}else {
				Map<String, String> map = new HashMap<String, String>();
				map.put("prodHiClass", prodHiClass); 
				map.put("prodMiClass", prodMiClass);
				map.put("prodLoClass", prodLoClass);
				
				List<ProductsVO> list = service.getCategory(map);
				session.setAttribute("list", list);
			}
			return "success"; 
		}

		  @RequestMapping("/productOnlyList") 
		  public String productOnlyList() {
		
				 return "/products/productsList"; 
		 }
		 
		@RequestMapping("/detail")
		public String productsDetail(long prodId, Model model, HttpSession session) {
			ProductsVO prodInfo = service.getOne(prodId);
			model.addAttribute("prodInfo", prodInfo);
		
			InventoryVO invenInfo = iService.getOne(prodId);
			model.addAttribute("invenInfo", invenInfo);
			
			List<ReviewVO> reviewList = reService.getReviewByProdId(prodId);
			model.addAttribute("reviewList", reviewList);
		
			long[] recentlyView= new long[5];
			
			if(session.getAttribute("recentlyView") !=null) {
				long[] temp = (long[])session.getAttribute("recentlyView");
				
				session.removeAttribute("recentlyView");
				boolean repeat = false;
				
				for(int i=0; i< temp.length; i++) {
					if(temp[i] == prodId) {
						repeat=true;
					}
				}
				if(repeat==false) {
					for(int i=0; i < temp.length-1; i++) {
							recentlyView[i+1] = temp[i];	
					} 
					recentlyView[0]=prodId;
					session.setAttribute("recentlyView", recentlyView);
				}else {
					for(int i=0; i < recentlyView.length; i++) {
						recentlyView[i] = temp[i];
						System.out.println(recentlyView[i]);
					}
				session.setAttribute("recentlyView", recentlyView);
			
				}
				//recentlyView[0]=prodId;
				//session.setAttribute("recentlyView", recentlyView);
		    }else {	
		    //	System.out.println("NULL");
		    	recentlyView[0]=prodId;
				session.setAttribute("recentlyView", recentlyView);
			//	System.out.println(recentlyView[0]);
		    }
		
			return "/products/detail";
		}
		@RequestMapping("/prodInsert")
		public String prodInsert(String psize, int quantity, String memId, long prodId, HttpSession session) {
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memId", memId);
			map.put("prodId", prodId);
			map.put("status", 0);
			
			CartVO cVo = caService.getCartExist(map); 
			
			if(cVo ==null) {
			
			CartVO vo = new CartVO(); 
			vo.setProdId(prodId); 
			vo.setMemId(memId);
			vo.setStatus(0); 
			vo.setQuantity(quantity); 
			vo.setPsize(psize);
			
			int insertCart = caService.addCart(vo);
			System.out.println("insertCart"+insertCart);
			
		}else { 
			Map<String, Object> map1 = new HashMap<String, Object>(); 
			
			long cartId = cVo.getCartId();
		
			map1.put("psize", psize); 
			map1.put("quantity", quantity);
			map1.put("cartId", cartId);
			
			int updateCart = caService.updateCart(map1); 
			
		}
	 
			System.out.println("insert 완료");	
			
			return "/products/productsList";
		}
		
		@RequestMapping("/detailInsert")
		public String detailInsert(HttpServletRequest req, String psize, int quantity, String memId, long prodId, HttpSession session) {
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memId", memId);
			map.put("prodId", prodId);
			map.put("status", 0);
			
			CartVO cVo = caService.getCartExist(map); 
			
			if(cVo ==null) {
			
			CartVO vo = new CartVO(); 
			vo.setProdId(prodId); 
			vo.setMemId(memId);
			vo.setStatus(0); 
			vo.setQuantity(quantity); 
			vo.setPsize(psize);
			
			int insertCart = caService.addCart(vo);
			System.out.println("insertCart"+insertCart);
			
		}else { 
			Map<String, Object> map1 = new HashMap<String, Object>(); 
			
			long cartId = cVo.getCartId();
		
			map1.put("psize", psize); 
			map1.put("quantity", quantity);
			map1.put("cartId", cartId);
			
			int updateCart = caService.updateCart(map1); 
			
		}
	 
			System.out.println("insert 완료");	
			String referer = req.getHeader("referer");	
			return "redirect:"+referer;
		}
	@RequestMapping("/carts")
	public String carts(String memId, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("status", 0);
//		System.out.println("=============들어오나"+map);
		List<Map<String,Object>> list = caService.getCartListByMemId(map);
//		System.out.println(list);
		for(Map<String, Object> vo:list) {
//			System.out.println("카트보기리스트"+vo);
		}
		model.addAttribute("list", list);
		return "/products/carts";
	}
	
	@RequestMapping("/cartsDelete")
	public String cartsDelete(String memId, long prodId, int cartId, Model model, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("prodId", prodId);
		map.put("status", 0);
//		CartVO cVo = caService.getCartExist(map);
		
		int delCart = caService.delCartById(cartId);
/*		if(delCart == 1) {
			model.addAttribute("map", map);
		}*/
				
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
	@RequestMapping("/cartSelect")
	@ResponseBody
	public String cartSelect(@RequestParam(value="values[]", required=false) String[] values, @RequestParam(value="carts[]", required=false) long[] carts, Model model, HttpSession session) { 

		for(int i=0; i<carts.length; i++) {
			System.out.println("carts" + carts[i] + " " + values[i]);
			System.out.println(values[i].equals("true"));
			if(values[i].equals("true")) {
						
				int cartSelect = caService.updateCartStatusOneUsingCartId(carts[i]); 
				
			}
		}

		session.setAttribute("values",values);
		session.setAttribute("carts",carts);
		return "/products/payment";
	}
	
	
	@RequestMapping("/payment")
	public String payment(Model model, HttpSession session, HttpServletRequest request) {
		
		
		
		String values = (String)session.getAttribute("values");
		long carts = (long)session.getAttribute("carts");
		
		String memId = (String)session.getAttribute("memId");
		CouponVO coupon = cpservice.getCoupon(memId);
		session.setAttribute("coupon", coupon);
//		System.out.println("=&*&^*==coupon"+coupon);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("status", 0);
		
		
		List<Map<String,Object>> list = caService.getCartListByMemId(map);
//		System.out.println(list);
		for(Map<String, Object> vo:list) {
//		System.out.println(vo);
		}
		model.addAttribute("list", list);

		return "/products/payment";
	} 
		
	
	
/*	@RequestMapping("/paymentSuccess")
	@ResponseBody
	public String paymentSuccess(String memId, Model model, Long amount) {
		System.out.println("총금액~"+amount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("status", 0);
		
		List<Map<String,Object>> list = caService.getCartListByMemId(map);
		for(Map<String, Object> vo:list) {
			System.out.println("@@@@@@@@@@@@@"+vo);
		}
		
		model.addAttribute("list", list);
		
		caService.updateCartStatusByOne(memId);
		
		return "/products/paymentSuccess";
	} */
	
	
	
	
	
//total 값 보내기
	@RequestMapping("/paymentProcess")
	@ResponseBody //자바 객체를 json 기반의 HTTP Body로 변환(데이터만 반환, 데이터를 보내주는 목적)
	public String paymentProcess(String memId, HttpSession session, Long amount) {
		System.out.println("!@!@!!@!@!@!@!#총금액~"+amount);
		session.setAttribute("amount",amount);
		
		return ""; 
	} 
	
	@RequestMapping("paymentSuccess")
	public String success(String memId, Model model, HttpSession session) {
		System.out.println("여기로 왔어용!");
		Long amount = (Long)session.getAttribute("amount");
		
		CouponVO coupon = cpservice.getCoupon(memId);
		
		String memGrade = coupon.getMemGrade();
		Long memAmount = coupon.getMemAmount();
		int memCoupon = 0; //coupon.getMemCoupon();
		int memPoint = 0; //coupon.getMemPoint();
		
		memAmount = memAmount + amount;
		memPoint = (int)(memPoint + 0.05*amount);
		if(memAmount>500000) {
			memGrade = "Gold";
		}else if(memAmount>200000) {
			memGrade = "Silver";
		}else {
			memGrade = "New";
		};
		//업데이트
		coupon.setMemAmount(memAmount);
		coupon.setMemCoupon(memCoupon);
		coupon.setMemGrade(memGrade);
		coupon.setMemPoint(memPoint);
		coupon.setMemId(memId);
		
		int result = cpservice.updateCoupon(coupon);
		System.out.println("memPoint"+memPoint);
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", memId);
		map.put("status", 0);

		List<Map<String,Object>> list = caService.getCartListByMemId(map);
		for(Map<String, Object> vo:list) {
//			System.out.println("@@@@@@@@@@@@@"+vo);
		}
		
		model.addAttribute("list", list);
//		caService.updateCartStatusByOne(memId); 

		return "/products/paymentSuccess"; 
	}
	
	@RequestMapping("/test")
	public String cartTest() {
		return "products/test";
	}
}
