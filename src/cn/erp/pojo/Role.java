package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role {
	private int ucid;
	private String roleCode;
	private String roleName;
	private Date createTime;
}
