package com.ssafy.happyhouse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.service.EnrollService;

@RestController
@CrossOrigin(origins = "*", maxAge = 6000)
@RequestMapping(value = "/enroll")
public class EnrollController {
	@Autowired
	private EnrollService ser;
	
	@PostMapping(headers = { "Content-type=application/json" })
	public void insert(@RequestBody HouseDealDto dto) throws Exception {
		System.out.println(dto.getAptName());
		ser.insert(dto);
	}
}
