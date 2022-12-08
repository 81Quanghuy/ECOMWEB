package vn.iotstar.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FilterModel {
	private Integer id;
	private Date timelogin;
	private Integer userid;
}
