package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.QnADto;
import com.ssafy.happyhouse.model.repo.QnARepo;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<QnADto> selectAll() throws Exception {
		return sqlSession.getMapper(QnARepo.class).selectAll();
	}

	@Override
	public QnADto selectOneByNo(int no) throws Exception {
		return sqlSession.getMapper(QnARepo.class).selectOneByNo(no);
	}

	@Override
	public void insert(QnADto qna) throws Exception {
		sqlSession.getMapper(QnARepo.class).insert(qna);
	}

	@Override
	public void update(QnADto qna) throws Exception {
		sqlSession.getMapper(QnARepo.class).update(qna);
	}

	@Override
	public void delete(int no) throws Exception {
		sqlSession.getMapper(QnARepo.class).delete(no);
	}
}
