package com.ssafy.happyhouse.model;

import java.sql.Timestamp;

public class QnADto {
	private int no;
	private String title, content, writer;
	private Timestamp date;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public QnADto(int no, String title, String content, String writer, Timestamp date) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.date = date;
	}

	public QnADto() {
		super();
	}

	@Override
	public String toString() {
		return "QnADto [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", date=" + date
				+ "]";
	}

}
