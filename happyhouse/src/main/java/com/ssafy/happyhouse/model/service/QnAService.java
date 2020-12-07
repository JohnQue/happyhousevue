package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.QnADto;

public interface QnAService {
	public List<QnADto> selectAll() throws Exception;
	public QnADto selectOneByNo(int no) throws Exception;
	public void insert(QnADto qna) throws Exception;
	public void update(QnADto qna) throws Exception;
	public void delete(int no) throws Exception;
}
