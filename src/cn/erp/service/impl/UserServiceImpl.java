package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.UserDao;
import cn.erp.pojo.User;
import cn.erp.service.UserService;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User loginValider(String userName, String userPassword) {
        // TODO Auto-generated method stub
        return userDao.loginValider(userName, userPassword);
    }
    @Override
    public List<User> getUserList() {
        // TODO Auto-generated method stub
        return userDao.getAll();
    }
	@Override
	public int Update(User user1) {
		// TODO Auto-generated method stub
		return userDao.Update(user1);
	}

}
