package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.InterestedAreaDto;
import com.ssafy.happyhouse.model.repo.InterestedAreaRepo;

@Service
public class InterestedAreaServiceImpl implements InterestedAreaService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<InterestedAreaDto> selectAll(String userid) throws Exception {
		return sqlSession.getMapper(InterestedAreaRepo.class).selectAll(userid);
	}

	@Override
	public void insert(InterestedAreaDto dto) throws Exception {
		sqlSession.getMapper(InterestedAreaRepo.class).insert(dto);
	}
	
	@Override
	public void delete(int no) throws Exception {
		sqlSession.getMapper(InterestedAreaRepo.class).delete(no);
	}
	
}