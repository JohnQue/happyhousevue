package com.ssafy.happyhouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 코로나 선별 진료소(Corona HealthCenter) 컨트롤러
 * @author JongHan
 *
 */
@Controller
@RequestMapping("/healthCenter")
public class CHCController {
	
	@RequestMapping
	public String healthCenter(){
		return "medical/healthcenter";
	}
	
}
