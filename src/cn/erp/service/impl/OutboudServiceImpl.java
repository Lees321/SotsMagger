package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.OutboudDao;
import cn.erp.pojo.Blog;
import cn.erp.pojo.User;
import cn.erp.service.OutboudService;
@Service
public class OutboudServiceImpl implements OutboudService {
	@Autowired
	private OutboudDao outboudDao;
	@Override
	public List<Blog> getOutboudList() {
		// TODO Auto-generated method stub
		return outboudDao.getOutboudList();
	}

	@Override
	public boolean addOutboud(Blog boud) {
		int result = outboudDao.addOutboud(boud);
		 if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
		
	}

	@Override
	public boolean delOutboud(int blogId) {
		int result = outboudDao.delOutboud(blogId);
		 if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public boolean updateOutboud(Blog boud) {
		int result = outboudDao.updateOutboud(boud);
		 if(result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public Blog findById(int oid) {
		// TODO Auto-generated method stub
		return outboudDao.findById(oid);
	}



}
