package com.ssafy.happyhouse.model.repo;

import java.util.List;

import com.ssafy.happyhouse.model.QnADto;

public interface QnARepo {
	public List<QnADto> selectAll() throws Exception;
  public QnADto selectOneByNo(int no) throws Exception;
  public void insert(QnADto qna) throws Exception;
  public void update(QnADto qna);
  public void delete(int no);
}
