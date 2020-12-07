package com.ssafy.happyhouse.model.repo;

import java.util.HashMap;
import java.util.List;

import com.ssafy.happyhouse.model.HealthCenterDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SafeHospitalDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.StoreInfoDto;

public interface MapRepo {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<StoreInfoDto> getStoreInDong(String dong) throws Exception;
	List<HouseDealDto> getDealByAptName(String aptName, String dong) throws Exception;
	StoreInfoDto getStoreInfoByName(String storeName) throws Exception;
	List<HealthCenterDto> getHealthCenters(HashMap<String, String> hc);
	List<SafeHospitalDto> getSafeHospitals(String address);
}
