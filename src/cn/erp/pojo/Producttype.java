package cn.erp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Producttype {
private int yid;
private String yName;
public String getyName() {
	return yName;
}
public void setyName(String yName) {
	this.yName = yName;
}

}
