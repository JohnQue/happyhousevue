package com.ssafy.happyhouse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.InterestedAreaDto;
import com.ssafy.happyhouse.model.service.InterestedAreaService;

/**
 * 모든 RestAPI구현 클래스는 SelectALL, SelectOne 먼저, 그다음 Insert, Update, Delete 순으로 메소드 나열
 * @author multicampus
 *
 */
@RestController
@CrossOrigin(origins = "*")
@RequestMapping(value = "/interested")
public class InterestedAreaController {
	
	@Autowired
	InterestedAreaService ser;
	
	@GetMapping("/{userid}")
	public List<InterestedAreaDto> selectAll(@PathVariable String userid) throws Exception {
		return ser.selectAll(userid);
	}
	
	@PostMapping
	public void insert(@RequestBody InterestedAreaDto dto) throws Exception{
		ser.insert(dto);
	}
	
	@DeleteMapping(value = "/{no}")
	public void delete(@PathVariable int no) throws Exception {
		ser.delete(no);
	}
}
