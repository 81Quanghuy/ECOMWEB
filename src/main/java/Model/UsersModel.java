package Model;

import java.sql.Date;

public class UsersModel {
	private int id;
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
    private int e_wallet; //decimal
    private Date createAt;
    private Date updateAt;
}
