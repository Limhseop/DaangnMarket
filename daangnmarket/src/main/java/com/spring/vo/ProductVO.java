package com.spring.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ProductVO {
	int rno, phit, price, pchoice, chat, favorite, report;
	String pid, ptitle, pcontent, pdate, pfile, psfile, category, location, id, saled;
	CommonsMultipartFile pfile1;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPchoice() {
		return pchoice;
	}
	public void setPchoice(int pchoice) {
		this.pchoice = pchoice;
	}
	public int getChat() {
		return chat;
	}
	public void setChat(int chat) {
		this.chat = chat;
	}
	public int getFavorite() {
		return favorite;
	}
	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSaled() {
		return saled;
	}
	public void setSaled(String saled) {
		this.saled = saled;
	}
	public CommonsMultipartFile getPfile1() {
		return pfile1;
	}
	public void setPfile1(CommonsMultipartFile pfile1) {
		this.pfile1 = pfile1;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPhit() {
		return phit;
	}
	public void setPhit(int phit) {
		this.phit = phit;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public String getPsfile() {
		return psfile;
	}
	public void setPsfile(String psfile) {
		this.psfile = psfile;
	}
	
	
}
