package com.ssafy.happyhouse.model.repo;

import java.util.List;

import com.ssafy.happyhouse.model.InterestedAreaDto;

public interface InterestedAreaRepo {
	List<InterestedAreaDto> selectAll(String userId) throws Exception;
	void insert(InterestedAreaDto dto) throws Exception;
	public void delete(int no) throws Exception;
}
