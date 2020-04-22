package org.adt.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.adt.domain.MapVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/map/*")
public class MapController {

	
	
	@PostMapping("/searchPlace")
	@CrossOrigin
	public void searchPlace(MapVO vo){
		
		String strUrl = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM";
		strUrl += "&input=paris";
		strUrl += "&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&language=ko";
		
		String jsonMessage = "hello";
		
		try {
			URL url = new URL(strUrl);

			HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();

			urlConn.setDoInput (true);

			urlConn.setDoOutput (true);

			urlConn.setRequestMethod("POST");

			urlConn.setRequestProperty("Content-Type", "application/json");

			urlConn.connect();

			DataOutputStream output = new DataOutputStream(urlConn.getOutputStream());

			log.info(output);
	
		} catch (Exception e){
			System.err.println(e.toString());
		}

	}	
	
	
}
