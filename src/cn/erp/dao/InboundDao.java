package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import cn.erp.pojo.Product;
import cn.erp.pojo.Producttype;

@Repository
public interface InboundDao {
    // ע�����ʽ��xml����
    // ע����ʽ������ҵ��Ƚϼ�
    // XML���õ���ʽ������ҵ����
    List<Product> getInboundList();
    @Insert("insert into sots_product(proName,yid,proDescrible,proPrice,proPhoto,proNumber,proType)"
        + " values(#{proName},#{yid},#{proDescrible},#{proPrice},#{proPhoto},#{proNumber},#{proType})")
    int addInbound(Product bound);
    @Update("update sots_product set proName=#{proName},proDescrible=#{proDescrible},"
        + "proPrice=#{proPrice},proPhoto=#{proPhoto},proNumber=#{proNumber},proType=#{proType} where pid=#{pid}")
    int updateInbound(Product bound);
    @Delete("delete from sots_product where pid=#{pid}")
    int delInbound(@Param("pid") int pid);
    @Select("select * from sots_product where pid=#{pid}")
    Product findById(@Param("pid") int pid);
}
