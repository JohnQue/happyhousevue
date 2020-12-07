package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.AttentionDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface AttentionService {
	/**
	 * 글 등록
	 * @param dto
	 * @throws SQLException 
	 * @throws Exception 
	 */
	public void insert(AttentionDto qna) throws SQLException;
	
	/**
	 * 글 수정
	 * @param no 번호
	 * @param title 제목
	 * @param content 내용
	 * @throws SQLException 
	 */
	public void update(AttentionDto dto) throws SQLException;
	
	/**
	 * 공지사항 삭제
	 * @param no
	 * @throws SQLException 
	 */
	public void delete(int no) throws SQLException;
	
	/**
	 * 번호에 맞는 공지사항 가져오기
	 * @param no 번호
	 * @return
	 * @throws SQLException 
	 */
	public AttentionDto selectOneByNo(int no) throws SQLException;

	/**
	 * 공지사항 리스트 추출
	 * @return 공지사항 전부를 담은 리스트 리턴 
	 * @throws Exception 
	 */
	public List<AttentionDto> selectAll()  throws Exception;

	/**
	 * 페이지 네비게이션
	 * @param map 
	 * @throws Exception 
	 */
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
