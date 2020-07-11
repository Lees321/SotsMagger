package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.TypeDao;
import cn.erp.pojo.Producttype;
import cn.erp.service.TypeService;
@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDao typeDao;
    @Override
    public List<Producttype> getTypeList() {
        // TODO Auto-generated method stub
        return typeDao.getTypeList();
    }

    @Override
    public boolean addType(Producttype product) {
        int result = typeDao.addType(product);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateType(Producttype product) {
        int result = typeDao.updateType(product);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Producttype findById(int yid) {
        // TODO Auto-generated method stub
        return typeDao.findById(yid);
    }

    @Override
    public boolean deleteType(int yid) {
        int result = typeDao.deleteType(yid);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

}
