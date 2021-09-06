package com.koreait.vo;

import java.util.Date;

public class MvcboardVO {

//	테이블 데이터와 동일한 이름으로 멤버변수 선언	
	private int idx;
	private String name;
	private String subject;
	private String content;
	private int ref;
	private int lev;
	private int seq;
	private int hit;
	private Date writeDate;
	
//	기본 생성자 만들고 이름, 제목, 내용 넘겨받아 초기화하는 생성자 만들기(idx빼고)
	public MvcboardVO() { }

	public MvcboardVO(String name, String subject, String content) {
//		super();
		this.name = name;
		this.subject = subject;
		this.content = content;
	}

//	getters&setters
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

//	toString
	@Override
	public String toString() {
		return "MvcboardVO [idx=" + idx + ", name=" + name + ", subject=" + subject + ", content=" + content + ", ref="
				+ ref + ", lev=" + lev + ", seq=" + seq + ", hit=" + hit + ", writeDate=" + writeDate + "]";
	}
	
	
}
