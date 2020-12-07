package com.ssafy.happyhouse.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.happyhouse.model.NewsDto;
import com.ssafy.happyhouse.model.NewsItemDto;

@Service
public class NewsService {
	public List<NewsItemDto> getAllNews() {
		 String clientId = "YxNzt44xDKswOVGwM9nW";//애플리케이션 클라이언트 아이디값";
     String clientSecret = "cXUjw14B38";//애플리케이션 클라이언트 시크릿값";
     try {
         String apiURL = "https://openapi.naver.com/v1/search/news.json?query=%EB%B6%80%EB%8F%99%EC%82%B0&sort=date&display=8";
         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection)url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("X-Naver-Client-Id", clientId);
         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
         con.setDoInput(true);
         int responseCode = con.getResponseCode();
         BufferedReader br;
         if(responseCode==200) { // 정상 호출
             br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else {  // 에러 발생
             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
             System.out.println(con.getRequestMethod());
         }
         String inputLine;
         StringBuffer response = new StringBuffer();
         while ((inputLine = br.readLine()) != null) {
             response.append(inputLine);
         }
         br.close();
         ObjectMapper mapper = new ObjectMapper();
         NewsDto news = mapper.readValue(response.toString(), NewsDto.class);
         return news.getItems();
     } catch (Exception e) {
         System.out.println(e);
     }
     return null;
	}
}
