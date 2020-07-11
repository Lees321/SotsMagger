package cn.erp.pojo;


import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Blog {
	private int blogId;//博客主键
	private String blogTitle;
	private String blogComment;
	private String blogComment2;
	private String blogCommentPhoto;
	private int userId;
	private int btid;
	private String bcode;
	private Date createTime;
	private BlogType blogType;//
	private List<User> users;//
	private List<BlogPicture> pictures;//
	private User user;
	public Blog(String blogTitle, int userId) {
		super();
		this.blogTitle = blogTitle;
		this.userId = userId;
	}
	
	
}
