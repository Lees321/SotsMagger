package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.InboundDao;
import cn.erp.pojo.Product;
import cn.erp.pojo.Producttype;
import cn.erp.service.InboundService;
@Service
public class InboundServiceImpl implements InboundService {
    @Autowired
    private InboundDao inboundDao;
    @Override
    public List<Product> getList() {
        // TODO Auto-generated method stub
        return inboundDao.getInboundList();
    }

    @Override
    public boolean addInbound(Product bound) {
        int result = inboundDao.addInbound(bound);
        if(result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateInbound(Product bound) {
        int result = inboundDao.updateInbound(bound);
        if(result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean deleteInbound(int id) {
        int result = inboundDao.delInbound(id);
        if(result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Product findInbound(int pid) {
        // TODO Auto-generated method stub
        return inboundDao.findById(pid);
    }

}
