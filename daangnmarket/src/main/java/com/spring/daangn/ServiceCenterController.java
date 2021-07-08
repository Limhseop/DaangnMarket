package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceCenterController {
	
	@RequestMapping(value="/service_center.do",method=RequestMethod.GET)
	public String service_center() {
		return "service_center/service_center";
	}
}
