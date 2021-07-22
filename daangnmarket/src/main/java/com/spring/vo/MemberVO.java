package com.spring.vo;

public class MemberVO {
	String id,pass,name,email,phone,addr,introduce,imagepath,sex,joindate,
	addr_post, addr_road, addr_detail, addr_jibun, admin;	//순서대로 우편번호, 도로명주소, 상세주소, 지번주소
	int sale,purchase;
	

	public String getAddr_jibun() {
		return addr_jibun;
	}
	public void setAddr_jibun(String addr_jibun) {
		this.addr_jibun = addr_jibun;
	}
	public String getAddr_post() {
		return addr_post;
	}
	public void setAddr_post(String addr_post) {
		this.addr_post = addr_post;
	}
	public String getAddr_road() {
		return addr_road;
	}
	public void setAddr_road(String addr_road) {
		this.addr_road = addr_road;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr_jibun) {
		addr_jibun.replace(" ", "%");
		String[] jibuns = addr_jibun.split("%");
		this.addr = jibuns[1]+" "+jibuns[2];
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	
	
}
