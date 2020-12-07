package com.ssafy.happyhouse.model.service;
import java.util.List;
import com.ssafy.happyhouse.model.InterestedAreaDto;

public interface InterestedAreaService {
	List<InterestedAreaDto> selectAll(String userId) throws Exception;
	void insert(InterestedAreaDto dto) throws Exception;
	public void delete(int no) throws Exception;
}
