package vn.iotstar.Entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@Table(name = "Users")
public class Users implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String firstName;
	private String lastName;
	private String slug; 
	private String email;
	private String phone;
	private Byte is_emailactive;
	private Byte is_phoneactive;
	private String hashed_password;
	private Byte role;
	private String address;
	private String avatar;
	private String cover;
	private int point;
	private int e_wallet; // decimal
	private Date createAt;
	private Date updateAt;


}
