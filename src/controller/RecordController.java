package controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import dao.CustomDao;
import dao.RecordDAO;
import dao.StaffDAO;
import entities.Record;

@Controller
@RequestMapping("/admin/")
public class RecordController {
	@Autowired
	private RecordDAO recordDAO;
	@Autowired
	private StaffDAO staffDAO;
	@Autowired
	private CustomDao customRecordDAO;
	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("recordlist")
	public String getRecordPage(ModelMap model) {
		model.put("staffList", staffDAO.getStaffList());
		model.put("record", new Record());
		model.put("recordList", customRecordDAO.getCustomRecordList());
		model.put("recordList2", customRecordDAO.getCustomRecordByDepart());
		return "admin/record";
	}

	@PostMapping("record-add")
	public String processAddRecord(@ModelAttribute("record") Record record, ModelMap model) {
		recordDAO.addRecord(record);
		model.put("staffList", staffDAO.getStaffList());
		model.put("record", new Record());
		
		String type = record.isType() ? "được cộng 1 điểm thưởng vì đã " : "đã bị 1 điểm phạt vì đã ";

		try {

			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true);
			
			helper.setTo(staffDAO.getStaffById(record.getStaff().getStaffId()).getEmail());
	
			helper.setSubject("Thông báo");
			helper.setText("Bạn " + type + "\"" + record.getReason().toLowerCase() + "\".");

			mailSender.send(mail);
			model.put("message", "Mail has been sent successfully!");
			model.put("color", "green");
		} catch (MessagingException e) {
		}

		model.put("message", "The record has been inserted successfull!");
		model.put("color", "green");
		model.put("recordList", customRecordDAO.getCustomRecordList());
		return "admin/record";
	}

	@GetMapping("detail")
	public String getDetail(ModelMap model, @RequestParam("idstaff") String idstaff) {
		model.put("recordList", recordDAO.getRecordByStaff(idstaff));
		model.put("staffName", staffDAO.getStaffById(idstaff).getName());
		return "admin/detail";
	}
}
