package org.adt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonController {
	
	
	@RequestMapping("/membersList3")
	@ResponseBody
	public ResponseEntity<List<Map<String, String>>> listMembers3() {

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for (int i = 0; i < 10; i++) {

			Map<String, String> map = new HashMap<String, String>();

			map.put("id", Integer.toString(i));
			list.add(map);
		}

		return new ResponseEntity(list, HttpStatus.OK);

	}
}
