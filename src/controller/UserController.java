package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.UserDAO;
import entities.User;

@Controller
@RequestMapping("/admin/")
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("userlist")
	public String getUserPage(ModelMap model) {
		model.put("listUser", userDAO.getUserList());
		return "admin/user";
	}
	
	@PostMapping("user-add")
	public String addUser( ModelMap model, @Validated @ModelAttribute("user") User user, BindingResult result) {
		
		if (result.hasErrors()) {
			
		} else {
			if (userDAO.getUserByUsername(user.getUsername()) != null) {
				result.rejectValue("username", "user", "This username has been taken");
			} else {
				userDAO.save(user);
				model.put("user", new User());
			}
			
		}
		
		
		model.put("listUser", userDAO.getUserList());
		return "admin/user";
	}
	
	@GetMapping("user-delete")
	public String deleteUser(@RequestParam("username") String username, ModelMap model) {
		userDAO.delete(username);
		model.put("listUser", userDAO.getUserList());
		model.put("user", new User());
		return "admin/user";
	}
	
	@ModelAttribute("user")
	public User getUser() {
		return new User();
	}
	
}
