package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import cn.erp.pojo.Producttype;
@Repository
public interface TypeDao {
    // ��ѯ���еķ�����Ϣ����
    List<Producttype> getTypeList();
    // ���ӷ�����Ϣ�ķ���
    int addType(Producttype product);
    // �޸ķ�����Ϣ�ķ���
    @Update("update sots_producttype set yName=#{yName} where yid=#{yid}")
    int updateType(Producttype product);
    // ����id��ѯ������Ϣ�ķ���
    Producttype findById(@Param("yid") int yid);
    // ɾ��������Ϣ�ķ���
    int deleteType(@Param("yid") int yid);
}
