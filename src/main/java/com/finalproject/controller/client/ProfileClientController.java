package com.finalproject.controller.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.model.RoleDTO;
import com.finalproject.model.UserDTO;
import com.finalproject.model.UserPrincipal;
import com.finalproject.service.UserService;
import com.mysql.cj.Session;

@Controller
@RequestMapping(value = "/client")
public class ProfileClientController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping(value = "/profile")
	public String profile() {
		return "client/profile";
	}
	
	@GetMapping(value = "/profile-from-cart")
	public String profileFromCart(HttpServletRequest request) {
		request.setAttribute("messageError", "Please update your delivery information.");
		return "client/profile";
	}
	
	@PostMapping(value = "/profile-update")
	public String profileUpdate(HttpServletRequest request,
			@RequestParam(name = "fullname", required = false) String fullname,
			@RequestParam(name = "phone") String phone,
			@RequestParam(name = "address") String address) {
		UserPrincipal userPrincipal = (UserPrincipal) request.getSession().getAttribute("user");
		userPrincipal.setFullname(fullname);
		userPrincipal.setPhone(phone);
		userPrincipal.setAddress(address);
		RoleDTO roleDTO = new RoleDTO();
		roleDTO.setRoleId(userPrincipal.getRole().getRoleId());
		roleDTO.setRoleName(userPrincipal.getRole().getRoleName());
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userPrincipal.getUserId());
		userDTO.setEmail(userPrincipal.getEmail());
		userDTO.setPhone(userPrincipal.getPhone());
		userDTO.setAddress(userPrincipal.getAddress());
		userDTO.setAvatar(userPrincipal.getAvatar());
		userDTO.setFullname(userPrincipal.getFullname());
		userDTO.setVerify(userPrincipal.isVerify());
		userDTO.setGender(userPrincipal.isGender());
		userDTO.setPassword(userPrincipal.getPassword());
		userDTO.setRoleDTO(roleDTO);
		
		userService.update(userDTO);
		request.setAttribute("messageSuccess", "Update delivery information successful.");
		return "client/profile";
	}
}
