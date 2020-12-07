package com.ssafy.happyhouse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PollutionController {
	
	@RequestMapping(value = "/pollution")
	public String pollution() {
		return "pollution/envstore";
	}
}
