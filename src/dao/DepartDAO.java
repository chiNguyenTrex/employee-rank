package dao;

import java.util.List;

import entities.Depart;

public interface DepartDAO {
	public List<Depart> getDepartList();
	public void addDepart(Depart depart);
	public void deleteDepart(String id);
	public void updateDepart(Depart depart);
	public Depart getDepartById(String id);
}
