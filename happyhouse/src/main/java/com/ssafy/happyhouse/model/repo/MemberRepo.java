package com.ssafy.happyhouse.model.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberRepo {
	/**
	 * 기능 1 : 회원가입
	 * @param dto
	 * @throws SQLException 
	 */
	public void join(MemberDto dto) throws SQLException;
	
	/**
	 * 기능 2 : 로그인
	 * @param dto
	 * @return 
	 */
	public MemberDto login(MemberDto dto) throws SQLException;
	
	/**
	 * 기능 3 : 회원정보 수정
	 * @param dto
	 * @return true면 업데이트 완료 false면 실패
	 */
	public boolean update(MemberDto dto) throws SQLException;
	
	/**
	 * 기능 4: 회원 탈퇴
	 * @param userid
	 * @return
	 */
	public void delete(String userid) throws SQLException;

	public List<MemberDto> selectAll();
}
