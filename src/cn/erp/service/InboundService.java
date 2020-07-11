package cn.erp.service;

import java.util.List;

import cn.erp.pojo.Product;
import cn.erp.pojo.Producttype;

public interface InboundService {
    List<Product> getList();
    
    boolean addInbound(Product bound);
    
    
    boolean deleteInbound(int pid);
    
    Product findInbound(int pid);

	boolean updateInbound(Product bound);
}
