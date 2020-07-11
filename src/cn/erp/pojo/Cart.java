package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private int cid;
	private String cartName;
	private String cartPhoto;
	private double cartDiscount;
	private double cartPrice;
	private int pid;
	private double cartTotal;
}
