package com.ssafy.happyhouse.model;

import java.util.List;

public class NewsDto {
	private String lastBuildDate;
	private int total;
	private int start;
	private int display;
	private List<NewsItemDto> items;
	public String getLastBuildDate() {
		return lastBuildDate;
	}
	public void setLastBuildDate(String lastBuildDate) {
		this.lastBuildDate = lastBuildDate;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	public List<NewsItemDto> getItems() {
		return items;
	}
	public void setItems(List<NewsItemDto> items) {
		this.items = items;
	}
	public NewsDto(String lastBuildDate, int total, int start, int display, List<NewsItemDto> items) {
		super();
		this.lastBuildDate = lastBuildDate;
		this.total = total;
		this.start = start;
		this.display = display;
		this.items = items;
	}
	public NewsDto() {
		// TODO Auto-generated constructor stub
	}
}
