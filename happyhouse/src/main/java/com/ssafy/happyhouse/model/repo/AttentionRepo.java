package com.ssafy.happyhouse.model.repo;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.AttentionDto;

public interface AttentionRepo {
	/**
	 * 글 등록
	 * @param dto
	 * @throws SQLException 
	 */
	public void insert(AttentionDto dto) throws SQLException;
	
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
	 */
	public void delete(int no) throws SQLException;
	
	/**
	 * 번호에 맞는 공지사항 가져오기
	 * @param no 번호
	 * @return
	 */
	public AttentionDto selectOneByNo(int no) throws SQLException;

	/**
	 * 공지사항 리스트 추출
	 * @param map 
	 * @return 공지사항 전부를 담은 리스트 리턴 OR 검색어에 따른 리스트
	 * @throws Exception 
	 */
	public List<AttentionDto> selectAll() throws Exception;

//	/**
//	 * 페이지 네비게이션용 토털 개수
//	 * @throws Exception 
//	 */
//	public int getTotalCount(Map<String, String> map) throws Exception;

}
