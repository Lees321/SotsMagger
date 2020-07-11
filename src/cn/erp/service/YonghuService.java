package cn.erp.service;

import java.util.List;

import cn.erp.pojo.Blog;
import cn.erp.pojo.User;

public interface YonghuService {
List<User> getOutboudList();
	
	boolean addOutboud(User boud);
	
	boolean updateOutboud(User boud);
	
	boolean delOutboud(int userId);
	
	User findById(int userId);

}
