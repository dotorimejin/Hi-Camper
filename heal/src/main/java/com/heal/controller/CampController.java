package com.heal.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CampController {

	/**
	 * 검색
	 * @param arg
	 * @return resultMap
	 * @throws IOException
	 */
	@RequestMapping("/camp/list")
		  public static Map<String, Object> main(String arg[]) throws IOException {
		 	Map<String, Object> resultMap = new HashMap<>();
		 	
		 	try {
		        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=8zlPEPUimdwlKj4tR1GHxBYspdzo%2FtrC6KVM3evVAhXoaySHJNby9hTKlaClH2jRoxPWtSonBIczpbubTRrbqA%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
		        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        System.out.println(sb.toString());
		        System.out.println(urlBuilder.toString());
		        
		        
		        /** xml -> json 변환 */
	            org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	            String xmlJSONObjString = xmlJSONObj.toString();
	            System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);
	 
	            
	            ObjectMapper objectMapper = new ObjectMapper();
	            Map<String, Object> map = new HashMap<>();
	            map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
	            Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	            Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	            Map<String, Object> items = null;
	            List<Map<String, Object>> itemList = null;
	 
	            items = (Map<String, Object>) body.get("items");
	            itemList = (List<Map<String, Object>>) items.get("item");
	 
	            System.out.println("### itemList="+itemList);
	            
	            resultMap.put("Result", "0000");
	            resultMap.put("numOfRows", body.get("numOfRows"));
	            resultMap.put("pageNo", body.get("pageNo"));
	            resultMap.put("totalCount", body.get("totalCount"));
	            resultMap.put("data", itemList);
	            
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            resultMap.clear();
	            resultMap.put("Result", "0001");
	        }
	 
	        return resultMap;
	    }
	
	@RequestMapping("/camp/test")
	public String test() {
		return "camp/test";
	}
	
	/** 
	 * 페이징 PathVariable 
	 * @RequestMapping("/camp/list{pageNo}")
	 * @param pageNo 페이지넘버
	 * @return mav
	 * @throws IOException
	 */
	@RequestMapping("/camp/list{pageNo}")
	  public static ModelAndView listPage(@PathVariable("pageNo") String pageNo) throws IOException {
	 	Map<String, Object> resultMap = new HashMap<>();
	 	System.out.println("#### pageNo :: " + pageNo);
	 	ModelAndView mav = new ModelAndView("camp/list");
	 	try {
	        String urlBuilder = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?serviceKey=8zlPEPUimdwlKj4tR1GHxBYspdzo%2FtrC6KVM3evVAhXoaySHJNby9hTKlaClH2jRoxPWtSonBIczpbubTRrbqA%3D%3D&pageNo="
	        					+ pageNo +
	        					"&numOfRows=20&MobileOS=ETC&MobileApp=AppTest";
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());

	        BufferedReader rd;
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        System.out.println(urlBuilder.toString());
	        
	        
	        // xml->json 변환
	        org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	        String xmlJSONObjString = xmlJSONObj.toString();
	        System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);

          
	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> map = new HashMap<>();
	        map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        Map<String, Object> items = null;
	        List<Map<String, Object>> itemList = null;

	        items = (Map<String, Object>) body.get("items");
	        itemList = (List<Map<String, Object>>) items.get("item");
	        System.out.println("### itemList="+itemList);
	        
	        mav.addObject("Result", "0000");
	        mav.addObject("numOfRows", body.get("numOfRows"));
	        mav.addObject("pageNo", pageNo);
	        mav.addObject("totalCount", body.get("totalCount"));
	        mav.addObject("data", itemList);
	        
          
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 		mav.addObject("Result", "0001");
	 	}

	 	return mav;
	}

	
	/**
	 * 검색
	 * @param keyword 검색어
	 * @return resultMap
	 * @throws IOException
	 */
	@RequestMapping("/camp/search")
	 public static Map<String, Object> searchList(String keyword) throws IOException {
		System.out.println("#### keyword : " + keyword);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=8zlPEPUimdwlKj4tR1GHxBYspdzo%2FtrC6KVM3evVAhXoaySHJNby9hTKlaClH2jRoxPWtSonBIczpbubTRrbqA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰), AND(안드로이드), WIN(윈도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")) ; /*검색 요청할 키워드(인코딩 필요)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        System.out.println(urlBuilder.toString());
        
        /** xml -> json 변환 */
        org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
        String xmlJSONObjString = xmlJSONObj.toString();
        System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);

        
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap<>();
        map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
        Map<String, Object> items = null;
        List<Map<String, Object>> itemList = null;

        items = (Map<String, Object>) body.get("items");
        itemList = (List<Map<String, Object>>) items.get("item");
        System.out.println("### itemList="+itemList);
        
        resultMap.put("Result", "0000");
        resultMap.put("numOfRows", body.get("numOfRows"));
        resultMap.put("pageNo", body.get("pageNo"));
        resultMap.put("totalCount", body.get("totalCount"));
        resultMap.put("data", itemList);
        
        
    } catch (Exception e) {
        e.printStackTrace();
        resultMap.clear();
        resultMap.put("Result", "0001");
    }

		return resultMap;
    }
	
	
	/**
	 * 검색 pathVariable
	 * @param pageNo 페이지넘버
	 * @param keyword 검색어
	 * @return mav
	 * @throws IOException
	 */
	@RequestMapping("/camp/search{pageNo}")
	public static ModelAndView searchPage(@PathVariable("pageNo") String pageNo, @RequestParam("keyword") String keyword) throws IOException {
	 	Map<String, Object> resultMap = new HashMap<>();
	 	
	 	System.out.println("#### pageNo :: " + pageNo);
	 	System.out.println("#### keyword :: " + keyword);
	 	ModelAndView mav = new ModelAndView("camp/search");
	 	try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=8zlPEPUimdwlKj4tR1GHxBYspdzo%2FtrC6KVM3evVAhXoaySHJNby9hTKlaClH2jRoxPWtSonBIczpbubTRrbqA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /*현재 페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰), AND(안드로이드), WIN(윈도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(keyword, "UTF-8")) ; /*검색 요청할 키워드(인코딩 필요)*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        System.out.println(urlBuilder.toString());
	        
	        /** xml -> json 변환 */
	        org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	        String xmlJSONObjString = xmlJSONObj.toString();
	        System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);

	        
	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> map = new HashMap<>();
	        map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
	        Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	        Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	        Map<String, Object> items = null;
	        List<Map<String, Object>> itemList = null;

	        items = (Map<String, Object>) body.get("items");
	        itemList = (List<Map<String, Object>>) items.get("item");
	        System.out.println("### itemList="+itemList);
	        
	        mav.addObject("Result", "0000");
	        mav.addObject("numOfRows", body.get("numOfRows"));
	        mav.addObject("pageNo", pageNo);
	        mav.addObject("totalCount", body.get("totalCount"));
	        mav.addObject("data", itemList);
	        
          
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 		mav.addObject("Result", "0001");
	 	}

	 	return mav;
	}
	
}

	

	



