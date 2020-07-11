package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Restaurant {
	private int rid;
	private int restaurantCode;
	private String restaurantName;
	private String restaurantDescrible;
	private double restaurantPrice;
	private String restaurantPhoto;
	private Date createTime;
	private double restaurantDiscount;
	private double restaurantCoupon;
	private double restaurantTotal;
	private String restaurantType;
	private String restaurantAddress;
	private int views;
	private double points;
}
