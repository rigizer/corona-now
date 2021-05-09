package kr.pe.rigizer.coronanow.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.pe.rigizer.coronanow.service.JsonService;

@Controller
public class JsonController {
	@Autowired private JsonService jsonService;
	
	@GetMapping(value="/json")
	public String test(Model model) {
		String[] location = {"seoul", "busan", "daegu", "incheon", "gwangju", "daejeon", "ulsan", "sejong", "gyeonggi", "gangwon", "chungbuk", "chungnam", "jeonbuk", "jeonnam", "gyeongbuk", "gyeongnam", "jeju"};
		
		String json = jsonService.getJson();
		Map<String, List<String>> parseJson = jsonService.parseJson(location, json);
		
		model.addAttribute("data", parseJson);
		model.addAttribute("location", location);
		
		return "json";
	}
}
