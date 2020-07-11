package cn.erp.service;

import java.util.List;

import cn.erp.pojo.Blog;
import cn.erp.pojo.User;


public interface OutboudService {
	List<Blog> getOutboudList();
	
	boolean addOutboud(Blog boud);
	
	boolean updateOutboud(Blog boud);
	
	boolean delOutboud(int blogId);
	
	Blog findById(int blogId);

	
}
