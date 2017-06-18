package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

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
import org.springframework.web.multipart.MultipartFile;

import dao.DepartDAO;
import dao.StaffDAO;
import entities.Depart;
import entities.Staff;

@Controller
@RequestMapping("/admin/")
public class StaffController {
	@Autowired
	public ServletContext context;

	@Autowired
	private StaffDAO staffDAO;

	@Autowired
	private DepartDAO departDAO;

	@ModelAttribute("departs")
	public List<Depart> getDepartList() {
		return departDAO.getDepartList();
	}

	@GetMapping("stafflist")
	public String getStaffList(ModelMap model) {
		model.put("staffList", staffDAO.getStaffList());
		model.put("staff", new Staff());
		return "admin/staff";
	}

	@PostMapping("staff-add")
	public String processFormAdd(ModelMap model, @RequestParam("image") MultipartFile image,
			@RequestParam("staffId") String staffid, @RequestParam("departId") String departid,
			@RequestParam("name") String name, @RequestParam("gender") boolean gender,
			@RequestParam("birthday") String birthday, @RequestParam("email") String email,
			@RequestParam("phone") String phone, @RequestParam("salary") double salary) {
		
		Staff staff = new Staff();
		
		staff.setBirthday(new Date(birthday));
		staff.setDepart(departDAO.getDepartById(departid));
		staff.setEmail(email);
		staff.setGender(gender);
		staff.setName(name);
		staff.setPhone(phone);
		staff.setSalary(salary);
		staff.setStaffId(staffid);

		try {
			String uploadPath = context
					.getRealPath("resources" + File.separator + "images" + File.separator + "services");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists())
				uploadDir.mkdirs();
			String nameImage = image.getOriginalFilename();
			image.transferTo(new File(uploadDir + File.separator + nameImage));
			staff.setPhoto(nameImage);
			staffDAO.save(staff);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		model.put("staffList", staffDAO.getStaffList());
		model.put("staff", new Staff());
		return "admin/staff";
	}

	@PostMapping("staff-update")
	public String processFormUpdate(@ModelAttribute("staff") Staff staff, ModelMap model) {
		staffDAO.update(staff);
		model.put("staffList", staffDAO.getStaffList());
		model.put("staff", new Staff());
		return "admin/staff";
	}

	@GetMapping("staff-delete")
	public String deleteStaff(@RequestParam("staffid") String id, ModelMap model) {
		staffDAO.deleteStaff(id);
		model.put("staffList", staffDAO.getStaffList());
		model.put("staff", new Staff());
		return "admin/staff";
	}

}
