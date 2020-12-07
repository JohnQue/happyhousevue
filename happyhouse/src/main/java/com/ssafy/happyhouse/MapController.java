package com.ssafy.happyhouse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.HealthCenterDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.NewsItemDto;
import com.ssafy.happyhouse.model.SafeHospitalDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.StoreInfoDto;
import com.ssafy.happyhouse.model.service.MapService;
import com.ssafy.happyhouse.model.service.NewsService;

/**
 * 동/군구/시에 대한 정보는 모두 여기서 얻는다.
 * 
 * @author JongHan
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/map")
public class MapController {
	@Autowired
	MapService ser;
	@Autowired
	NewsService newsSer;

	@GetMapping(value = "/sido", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return ser.getSido();
	}

	@GetMapping(value = "/gugun/{sido}", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getGugunInSido(@PathVariable String sido) throws Exception {
		return ser.getGugunInSido(sido);
	}

	@GetMapping(value = "/dong/{gugun}", headers = { "Content-type=application/json" })
	public List<HouseInfoDto> getDong(@PathVariable String gugun) throws Exception {
		return ser.getDongInGugun(gugun);
	}

	@GetMapping(value = "/apt/{dong}", headers = { "Content-type=application/json" })
	public List<HouseInfoDto> getApt(@PathVariable String dong) throws Exception {
		return ser.getAptInDong(dong);
	}

	@GetMapping(value = "/store/{dong}", headers = { "Content-type=application/json" })
	public List<StoreInfoDto> getStore(@PathVariable String dong) throws Exception {
		return ser.getStoreInDong(dong);
	}

	@GetMapping(value = "/deal/{dong}/{aptName}", headers = { "Content-type=application/json" })
	public List<HouseDealDto> getDealByAptName(@PathVariable String aptName, @PathVariable String dong) throws Exception {
		return ser.getDealByAptName(aptName, dong);
	}

	/**
	 * 구글맵 API에서 빨간색 마커들이 상점인데 그 상점들 중 하나를 클릭하면 가게이름을 매개변수로 받고, 그 가게이름과 일치하는 정보를
	 * DB에서 찾아 결과값 리턴 그럼 ajax를 통해 해당 마커에 대한 정보를 map에서 띄워줌
	 * 
	 * @param storeName
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/storename/{storeName}", headers = { "Content-type=application/json" })
	public StoreInfoDto getStoreInfoByName(@PathVariable String storeName) throws Exception {
		return ser.getStoreInfoByName(storeName);
	}

	@GetMapping(value = "/healthcenter/{sido}/{gugun}", headers = { "Content-type=application/json" })
	public List<HealthCenterDto> getHealthCenters(@PathVariable String sido, @PathVariable String gugun)
			throws Exception {
		HashMap<String, String> hc = new HashMap<String, String>();
		hc.put("sido", sido);
		hc.put("gugun", gugun);
		return ser.getHealthCenters(hc);
	}

	@GetMapping(value = "/safehospital/{sido}/{gugun}", headers = { "Content-type=application/json" })
	public List<SafeHospitalDto> getSafeHospitals(@PathVariable String sido, @PathVariable String gugun)
			throws Exception {
		String address = sido + " " + gugun;
		return ser.getSafeHospitals(address);
	}

	@GetMapping(value = "/news", headers = { "Content-type=application/json" })
	public List<NewsItemDto> getNewsItems() {
		return newsSer.getAllNews();
	}
}