package dao;

import java.util.List;

import entities.User;

public interface UserDAO {
	
	public List<User> getUserList();
	public void save(User user);
	public void delete(String username);
	public User getUserByUsername(String username);
	public User checkLogin(String username, String password);
}
