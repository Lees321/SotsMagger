package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.Blog;
import cn.erp.pojo.User;
@Repository
public interface YonghuDao {
	@Select("select*from sots_user")
	List<User> getOutboudList();
	@Insert("insert into sots_user(userName,userPassword,userGender,userEmail,userPhone,userPhoto,createTime)"
		        + " values(#{userName},#{userPassword},#{userGender},#{userEmail},#{userPhone},#{userPhoto},#{createTime})")
	int addOutboud(User boud);
	@Update("update sots_user set userName=#{userName},userPassword=#{userPassword},"
		        + "userGender=#{userGender},userEmail=#{userEmail},userPhone=#{userPhone}"
		        + ",userPhoto=#{userPhoto} where userId=#{userId}")
	int updateOutboud(User boud);
	@Delete("delete from sots_user where userId=#{userId}")
	int delOutboud(@Param("userId") int userId);
	 @Select("select * from sots_user where userId=#{userId}")
User findById(@Param("userId") int userId);
	List<User> getTypeList();
}
