package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.AttentionDto;
import com.ssafy.happyhouse.model.repo.AttentionRepo;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class AttentionServiceImpl implements AttentionService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(AttentionDto dto) throws SQLException {
		sqlSession.getMapper(AttentionRepo.class).insert(dto);
	}

	@Override
	public void update(AttentionDto dto) throws SQLException {
		sqlSession.getMapper(AttentionRepo.class).update(dto);
	}
	
	@Override
	public void delete(int no) throws SQLException {
		sqlSession.getMapper(AttentionRepo.class).delete(no);
	}

	@Override
	public AttentionDto selectOneByNo(int no) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(AttentionRepo.class).selectOneByNo(no);
	}

	@Override
	public List<AttentionDto> selectAll() throws Exception {
		return sqlSession.getMapper(AttentionRepo.class).selectAll();
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("key", map.get("key") == null ? "" : map.get("key"));
//		param.put("word", map.get("word") == null ? "" : map.get("word"));
//		int currentPage = Integer.parseInt(map.get("pg"));
//		int sizePerPage = Integer.parseInt(map.get("spp"));
//		int start = (currentPage - 1) * sizePerPage;
//		param.put("start", start);
//		param.put("spp", sizePerPage);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
//		int naviSize = 10;
//		int currentPage = Integer.parseInt(map.get("pg"));
//		int sizePerPage = Integer.parseInt(map.get("spp"));
//		PageNavigation pageNavigation = new PageNavigation();
//		pageNavigation.setCurrentPage(currentPage);
//		pageNavigation.setNaviSize(naviSize);
//		int totalCount = sqlSession.getMapper(AttentionRepo.class).getTotalCount(map);
//		pageNavigation.setTotalCount(totalCount);
//		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
//		pageNavigation.setTotalPageCount(totalPageCount);
//		boolean startRange = currentPage <= naviSize;
//		pageNavigation.setStartRange(startRange);
//		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
//		pageNavigation.setEndRange(endRange);
//		pageNavigation.makeNavigator();
//		return pageNavigation;
//	}
}
