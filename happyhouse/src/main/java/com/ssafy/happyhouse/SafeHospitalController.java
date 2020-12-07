package com.ssafy.happyhouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/safeHospital")
public class SafeHospitalController {
	
	@RequestMapping
	public String safeHospital(){
		return "medical/safehospital";
	}
}
