package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int userId;
	private String userName;
	private String userPassword;
	private String userGender;
	private String userCode;
	private String userEmail;
	private String userPhone;
	private String userPhoto;
	private Date createTime;
	private int ucid;
	private int bolgId;
	private int userRole;
}
