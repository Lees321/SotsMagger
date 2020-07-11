package cn.erp.pojo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wish {
	private int sid;
	private int userId;
	private int pid;
	private User user;
	private List<Product> products;
}
