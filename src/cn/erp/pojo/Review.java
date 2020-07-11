package cn.erp.pojo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int vid;
	private int userId;
	private String reViews;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    // 解决json格式的日期操作
    @JSONField(format = "yyyy-MM-dd")
	private Date createTime;
	private String vCode;
	private int pid;
	private Product product;//商品表
	private List<User> users;//用户表
	
}
