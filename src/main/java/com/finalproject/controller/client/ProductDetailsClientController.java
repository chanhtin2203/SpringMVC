package com.finalproject.controller.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.service.ProductService;
@Controller
@RequestMapping(value = "/client")
public class ProductDetailsClientController {

	@Autowired
	private ProductService productService;
	
	
	@GetMapping(value = "/product-details")
	public String productDetails(HttpServletRequest request, @RequestParam(name = "productId") long productId) {
		request.setAttribute("product", productService.findById(productId));
		return "client/product_details";
	}
}
