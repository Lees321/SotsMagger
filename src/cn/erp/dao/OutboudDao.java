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
public interface OutboudDao {
	List<Blog> getOutboudList();
	@Insert("insert into sots_blog(blogTitle,blogComment,blogCommentPhoto,createTime,userId)"
		        + " values(#{blogTitle},#{blogComment},#{blogCommentPhoto},#{createTime},#{userId})")
	int addOutboud(Blog boud);
	@Update("update sots_blog set blogTitle=#{blogTitle},blogComment=#{blogComment},"
		        + "blogCommentPhoto=#{blogCommentPhoto},userId=#{userId} where blogId=#{blogId}")
	int updateOutboud(Blog boud);
	@Delete("delete from sots_blog where blogId=#{blogId}")
	int delOutboud(@Param("blogId") int blogId);
	 @Select("select * from sots_blog where blogId=#{blogId}")
     Blog findById(@Param("blogId") int blogId);
	List<User> getTypeList();
}
