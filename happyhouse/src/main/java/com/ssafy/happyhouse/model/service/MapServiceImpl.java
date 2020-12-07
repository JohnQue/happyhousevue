package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HealthCenterDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SafeHospitalDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.StoreInfoDto;
import com.ssafy.happyhouse.model.repo.MapRepo;

@Service
public class MapServiceImpl implements MapService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return sqlSession.getMapper(MapRepo.class).getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return sqlSession.getMapper(MapRepo.class).getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return sqlSession.getMapper(MapRepo.class).getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return sqlSession.getMapper(MapRepo.class).getAptInDong(dong);
	}

	@Override
	public List<StoreInfoDto> getStoreInDong(String dong) throws Exception {
		return sqlSession.getMapper(MapRepo.class).getStoreInDong(dong);
	}

	@Override
	public List<HouseDealDto> getDealByAptName(String aptName, String dong) throws Exception {
		return sqlSession.getMapper(MapRepo.class).getDealByAptName(aptName, dong);
	}

	@Override
	public StoreInfoDto getStoreInfoByName(String storeName) throws Exception {
		return sqlSession.getMapper(MapRepo.class).getStoreInfoByName(storeName);
	}

	@Override
	public List<HealthCenterDto> getHealthCenters(HashMap<String, String> hc) {
		return sqlSession.getMapper(MapRepo.class).getHealthCenters(hc);
	}

	@Override
	public List<SafeHospitalDto> getSafeHospitals(String address) {
		return sqlSession.getMapper(MapRepo.class).getSafeHospitals(address);
	}


}
