package kr.co.mall4Us.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mall4Us.service.InquiryService;
import kr.co.mall4Us.service.InventoryService;
import kr.co.mall4Us.service.ProductsService;
import kr.co.mall4Us.vo.InventoryVO;
import kr.co.mall4Us.vo.ProductsVO;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	ProductsService pservice;
	@Autowired
	InventoryService iservice;
	@Autowired
	InquiryService qservice;

	/*
	@RequestMapping("/sold")
	public String soldProducts(Model model) {

		List<Map<String, Object>> list = qservice.soldProducts();
		
		for(Map<String, Object> item: list) {
			System.out.println(item);
			
		}

		model.addAttribute("list", list);
		
		return "/prodRegi/productSold";
	}
	*/
	
	@RequestMapping("/sold")
	public String sortProducts( @RequestParam(defaultValue="0") int sort, Model model) {

		List<Map<String, Object>> list = null;
		
		if (sort == 1) {
			list = qservice.soldProducts();
		}else if (sort == 2) {
			list = qservice.soldProductsByClass();
		}else if (sort == 3) {
			list = qservice.soldProductsByPrice();
		}else {
			list = qservice.soldProducts();
		}
		
		model.addAttribute("list", list);
		
		return "/prodRegi/productSold";
		
	}
	
	@RequestMapping("/delete")
	public String delete(String cartId, String quantity, HttpServletRequest request, Model model) {
		
		System.out.println("여기왔어요");
		
		System.out.println("CartID= " + cartId);
		System.out.println("Quantity= " + quantity);
		
		model.addAttribute("quantity", quantity);
		
		String referer = request.getHeader("Referer");
		return  "redirect:"+ referer;
		
	}

	
	@RequestMapping("/1234")
	public String productRegist() {
		System.out.println("여기왔어요");
		return "/prodRegi/productRegist";
	}

	@RequestMapping("/productInput")
	public String productInput(ProductsVO pvo, InventoryVO ivo) {

		pservice.addProd(pvo);
		iservice.addInven(ivo);
		
		return "redirect:/manager/1234";
	}

	@RequestMapping("/search")
	public String productSearch(String prodHiClass, String prodMiClass, String prodLoClass,  Model model  ) {

		model.addAttribute("message", false);
		
		if (prodHiClass != null) {
			
			model.addAttribute("prodHiClass", prodHiClass);
			model.addAttribute("prodMiClass", prodMiClass);
			model.addAttribute("prodLoClass", prodLoClass);
			
			Map<String, String> map = new HashMap<>();

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
			
			//List<ProductVO> list = qservice.dynamicInventory(map);
			List<Map<String, Object>> list = qservice.dynamicInventorySearch(map);
			
			for(Map<String, Object> item: list) {
				System.out.println(item);
				
			}

			model.addAttribute("list", list);
			model.addAttribute("message", true);
			

		}

		return "/prodRegi/productSearch";
	}

/*	
	@RequestMapping("/search")
	public String productSearch(String prodHiClass, String prodMiClass, String  prodLoClass, Model model  ) {

		model.addAttribute("message", false);
		
		
		if (prodHiClass != null && prodMiClass != null && prodLoClass != null) {

			System.out.println("Search Start");
			
			List<Map<String, Object>> list = qservice.viewInventory();
			
			model.addAttribute("list", list);
			model.addAttribute("message", true);
			
			for(Map<String, Object> item : list) {
				
				System.out.println(item);
				
			}
			
		}
		
		return "/prodRegi/productSearch";
	}
*/
	
	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request, HttpSession session ) {

		String memId = request.getParameter("memId");
		String memPassword = request.getParameter("memPassword");
		
		session.setAttribute("flag", 1);
		
		String referer = request.getHeader("Referer");
		 
		return "redirect:"+ referer;
		
	}

	
	
	



}
