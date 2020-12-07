package com.ssafy.happyhouse.model.repo;

import com.ssafy.happyhouse.model.HouseDealDto;

public interface EnrollRepo {

	public void inserthd(HouseDealDto hd);

	public void inserthi(HouseDealDto hd);

	public int isexist(HouseDealDto hd);
}
