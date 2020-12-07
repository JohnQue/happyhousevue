package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.repo.MemberRepo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void join(MemberDto dto) throws Exception {
		sqlSession.getMapper(MemberRepo.class).join(dto);
	}

	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		if(dto.getUserid() == null || dto.getPassword() == null) {
			return null;
		}
		return sqlSession.getMapper(MemberRepo.class).login(dto);
	}

	@Override
	public void update(MemberDto dto) throws Exception {
		sqlSession.getMapper(MemberRepo.class).update(dto);
	}

	@Override
	public void delete(String userid) throws Exception {
		sqlSession.getMapper(MemberRepo.class).delete(userid);
	}

	@Override
	public List<MemberDto> selectAll() {
		return sqlSession.getMapper(MemberRepo.class).selectAll();
	}
}
