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

import dao.CustomDao;
import dao.UserDAO;
import entities.User;

@Controller

public class Dispatcher {
	@Autowired
	private CustomDao customDAO;
	
	@Autowired
	private UserDAO userDAO;

	@GetMapping("login")
	public String getLogin() {
		return "login";
	}

	@PostMapping("user-login")
	public String createLogin(HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password, ModelMap model) {
		if (userDAO.checkLogin(username, password) == null) {
			model.put("message", "Username hoặc mật khẩu không đúng");
			return "login";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", userDAO.checkLogin(username, password));

		return "home";
	}

	@GetMapping("logout")
	public String getLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "login";
	}

	@GetMapping("home")
	public String getHome() {
		return "home";
	}

	@GetMapping("record")
	public String getRecord(ModelMap model) {
		model.put("recordList2", customDAO.getCustomRecordSort());
		return "record";
	}

	@GetMapping("depart")
	public String getDepart(ModelMap model) {
		model.put("departRecord", customDAO.getCustomRecordByDepart());
		return "depart";
	}

	@GetMapping("contact")
	public String getContact() {
		return "contact";
	}

	@GetMapping("profile")
	public String getProfile() {
	
		return "profile";
	}

}
