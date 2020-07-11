package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import cn.erp.pojo.User;

/**
 * �������ݿ��Ľӿ�
 * @author lindy
 * @����ʱ�� 2020��5��12������10:37:01
 */
@Repository
public interface UserDao {
    // ��¼��֤ username,password
    // ����ֵ�̶������ǾͿ���ʹ��@Paramע����ʵ�ִ���
    User loginValider(@Param("userName") String userName,
        @Param("userPassword") String userPassword);
    
    List<User> getAll();
@Update("update sots_user set userPassword=#{userPassword} where userId=#{userId}")
	int Update(User user1);
    
}
