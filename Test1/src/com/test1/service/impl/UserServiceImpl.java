package com.test1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test1.beans.User;
import com.test1.dao.BaseDAO;
import com.test1.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private BaseDAO<User> baseDAO;

	@Override
	public void saveUser(User user) {
		baseDAO.save(user);
	}

	@Override
	public void deleteUser(User user) {
		baseDAO.delete(user);
	}

	@Override
	public void updateUser(User user) {
		baseDAO.update(user);

	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		String hql = "from com.test1.beans.User";
		return baseDAO.find(hql);
	}

	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		String hql = "from com.test1.beans.User where id=" + userId;
		return baseDAO.find(hql).get(0);
	}

	@Override
	public List<User> findByNumber(String number) {
		String hql = "from com.test1.beans.User where number = ?";
		String[] para = { number };

		return baseDAO.find(hql, para);
	}

	@Override
	public List<User> findByEmail(String email) {
		String hql = "from com.test1.beans.User where email = ?";
		String[] para = { email };

		return baseDAO.find(hql, para);
	}

	@Override
	public List<User> findByIDCard(String iDCard) {
		String hql = "from com.test1.beans.User where IDCard = ?";
		String[] para = { iDCard };

		return baseDAO.find(hql, para);
	}

}
