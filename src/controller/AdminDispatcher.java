package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.UserDAO;
import entities.User;

@Controller
@RequestMapping("/admin/")
public class AdminDispatcher {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("login") 
	public String loginPage() {
		return "admin/login";
	}

	@PostMapping("admin-login")
	public String getLogin(HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password, ModelMap model) {
	
		if (userDAO.checkLogin(username, password) != null && userDAO.checkLogin(username, password).getRole() ) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", userDAO.checkLogin(username, password));
			return "admin/index";
		}
		
		
		model.put("message", "Phải là tài khoản admin và nhập đúng username và password");
		return "admin/login";
	}
	
	@GetMapping("logout")
	public String getHomePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "admin/login";
	}
	
	
	
	
}
