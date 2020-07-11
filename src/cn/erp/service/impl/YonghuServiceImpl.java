package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.OutboudDao;
import cn.erp.dao.YonghuDao;
import cn.erp.pojo.Blog;
import cn.erp.pojo.User;
import cn.erp.service.YonghuService;
@Service
public class YonghuServiceImpl implements YonghuService {
	@Autowired
	private YonghuDao yonghuDao;
	@Override
	public List<User> getOutboudList() {
		// TODO Auto-generated method stub
		return yonghuDao.getOutboudList();
	}

	@Override
	public boolean addOutboud(User boud) {
		int result = yonghuDao.addOutboud(boud);
		 if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
		
	}

	@Override
	public boolean delOutboud(int userId) {
		int result = yonghuDao.delOutboud(userId);
		 if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public boolean updateOutboud(User boud) {
		int result = yonghuDao.updateOutboud(boud);
		 if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		return yonghuDao.findById(userId);
	}



}
