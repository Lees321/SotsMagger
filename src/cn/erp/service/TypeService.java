package cn.erp.service;

import java.util.List;
import cn.erp.pojo.Producttype;


public interface TypeService {
    // ��ѯ���еķ�����Ϣ����
    List<Producttype> getTypeList();
    // ���ӷ�����Ϣ�ķ���
    boolean addType(Producttype product);
    // �޸ķ�����Ϣ�ķ���
    boolean updateType(Producttype product);
    // ����id��ѯ������Ϣ�ķ���
    Producttype findById(int yid);
    // ɾ��������Ϣ�ķ���
    boolean deleteType(int yid);
}
