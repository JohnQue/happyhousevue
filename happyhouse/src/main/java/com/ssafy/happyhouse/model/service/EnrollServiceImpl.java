package com.ssafy.happyhouse.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.repo.EnrollRepo;

@Service
public class EnrollServiceImpl implements EnrollService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
  public void insert(HouseDealDto hd) {
     sqlSession.getMapper(EnrollRepo.class).inserthd(hd);
     int isExist = sqlSession.getMapper(EnrollRepo.class).isexist(hd);
     if(isExist==0)
        sqlSession.getMapper(EnrollRepo.class).inserthi(hd);
     
  }
}
