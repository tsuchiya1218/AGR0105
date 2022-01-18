package com.gogocar.bean;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String drivelicense;

    private String birthday;

    private String tel;

    private String email;

    private String address;

    private String regdate;

    private Integer credit;
    
    

    public User(Integer id, String username, String password, String drivelicense, String birthday, String tel,
			String email, String address, String regdate, Integer credit) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.drivelicense = drivelicense;
		this.birthday = birthday;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.regdate = regdate;
		this.credit = credit;
	}
    
    

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getDrivelicense() {
        return drivelicense;
    }

    public void setDrivelicense(String drivelicense) {
        this.drivelicense = drivelicense == null ? null : drivelicense.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate == null ? null : regdate.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }



	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", drivelicense=" + drivelicense
				+ ", birthday=" + birthday + ", tel=" + tel + ", email=" + email + ", address=" + address + ", regdate="
				+ regdate + ", credit=" + credit + "]";
	}
    
    
}