package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {
	/**
	 * 기능 1 : 회원가입
	 * @param dto
	 * @throws Exception 
	 */
	public void join(MemberDto dto) throws Exception;
	
	/**
	 * 기능 2 : 로그인
	 * @param dto
	 * @return 
	 */
	public MemberDto login(MemberDto dto) throws Exception;
	
	/**
	 * 기능 3 : 회원정보 수정
	 * @param dto
	 */
	public void update(MemberDto dto) throws Exception;
	
	/**
	 * 기능 4: 회원 탈퇴
	 * @param userid
	 */
	public void delete(String userid)  throws Exception;

	/**
	 * 기능 5: 회원 리스트
	 * @param map
	 */
	public List<MemberDto> selectAll();
	
	
	
}
