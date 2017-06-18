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


import dao.DepartDAO;
import entities.Depart;

@Controller
@RequestMapping("/admin/")
public class DepartController {
	@Autowired
	private DepartDAO departDAO;
	
	@GetMapping("departlist")
	public String getDepartPage(ModelMap model) {
		model.put("depart", new Depart());
		model.put("departList" , departDAO.getDepartList());
		return "admin/depart";
	}
	
	@PostMapping("add-depart")
	public String addDepart(ModelMap model, @Validated @ModelAttribute("depart") Depart depart, BindingResult result) {
		if (result.hasErrors()) {
			
		} else {
			if (departDAO.getDepartById(depart.getDepartId()) != null) {
				result.rejectValue("departId", "depart", "This id is exist");
			} else {
				departDAO.addDepart(depart);
				model.put("depart", new Depart());
			}
		}
		
		model.put("departList" , departDAO.getDepartList());
		return "admin/depart";
	}
	
	@PostMapping("update-depart")
	public String update(ModelMap model, @ModelAttribute("depart") Depart depart) {
		departDAO.updateDepart(depart);
		model.put("depart", new Depart());
		model.put("departList" , departDAO.getDepartList());
		return "admin/depart";
	}
	
	@GetMapping("delete-depart")
	public String deleteDepart(@RequestParam("departid") String id, ModelMap model) {
		departDAO.deleteDepart(id);
		model.put("depart", new Depart());
		model.put("departList" , departDAO.getDepartList());
		return "admin/depart";
	}
	

}
