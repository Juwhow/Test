package com.test1.service;

import java.util.List;

import com.test1.beans.User;

public interface UserService {

	public void saveUser(User user);

	public void deleteUser(User user);

	public void updateUser(User user);

	public List<User> findByNumber(String number);
	
	public List<User> findByEmail(String email);
	
	public List<User> findByIDCard(String iDCard);

	public List<User> getAll();

	public User findById(int userId);

}
