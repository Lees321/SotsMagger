package cn.erp.service;
/**
 * �û�����ҵ��ӿ�
 * @author lindy
 * @����ʱ�� 2020��5��12������10:43:25
 */

import java.util.List;

import cn.erp.pojo.User;

public interface UserService {
    User loginValider(String userName,String userPassword);
    List<User> getUserList();
	int Update(User user1);
}
