package kr.pe.rigizer.coronanow.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

@Service
public class JsonService {
	private String serviceKey = "PcIJOxVM6t4wHjuzkLYdaNs3ypKo79hZv";
	
	public String getJson() {
		String apiUrl = "https://api.corona-19.kr/korea/country/new/?serviceKey=" + serviceKey;
		String json = "";
		
		try {
			Document doc = Jsoup.connect(apiUrl)
					.ignoreContentType(true)
					.get();
			json = doc.body().text();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return json;
	}
	
	public Map<String, List<String>> parseJson(String[] location, String json) {
		Map<String, List<String>> map = new HashMap<>();
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject) jsonParser.parse(json);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int locationLength = location.length;
		
		for(int i = 0; i < locationLength; i++) {
			JSONObject locationObject = (JSONObject) jsonObject.get(location[i]);

			List<String> locationInfo = new ArrayList<>();
			locationInfo.add(locationObject.get("countryName").toString());
			locationInfo.add(locationObject.get("newCase").toString());
			locationInfo.add(locationObject.get("totalCase").toString());
			locationInfo.add(locationObject.get("recovered").toString());
			locationInfo.add(locationObject.get("death").toString());
			locationInfo.add(locationObject.get("percentage").toString());
			locationInfo.add(locationObject.get("newCcase").toString());
			locationInfo.add(locationObject.get("newFcase").toString());
			
			map.put(location[i], locationInfo);
		}
		
		return map;
	}
}
