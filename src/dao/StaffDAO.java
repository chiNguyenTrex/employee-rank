package dao;

import java.util.List;

import entities.Staff;

public interface StaffDAO {
	public Staff getStaffById(String id);
	public List<Staff> getStaffList();
	public void save(Staff staff);
	public void update(Staff staff);
	public void deleteStaff(String id);
}
