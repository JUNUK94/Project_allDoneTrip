package org.adt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;
import org.adt.mapper.PlannerMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class plannerServiceImpl implements plannerService {
	
	@Autowired
	private PlannerMapper mapper;
	
	// 플래너 리스트 가져오기
	@Override
	public List<PlannerVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	// 플래너 전체 갯수 카운트
	@Override
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}

	// 플래너 정렬
	@Override
	public List<PlannerVO> sorting(Criteria cri) {
		return mapper.sorting(cri);
	}
	
	// 조회수 추가
	@Override
	public void addClickNum(Long plan_No) {
		mapper.addClickNum(plan_No);
	}
	
	// 쿠키 체크 후 조회수 추가
	@Override
	public void checkCookie(HttpServletResponse response, HttpServletRequest request, Long plan_No) {
	
		Cookie cookies[] = request.getCookies();
		Map mapCookie = new HashMap();
		
		if(request.getCookies() != null){
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				mapCookie.put(obj.getName(),obj.getValue());
			}
		}

		String cookie_read_count = (String) mapCookie.get("read_count");
		String new_cookie_read_count = "|" + plan_No;
		
		if (StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1 ) {
			Cookie cookie = new Cookie("read_count", cookie_read_count + new_cookie_read_count); 
			response.addCookie(cookie); 
			this.addClickNum(plan_No);
		}
	}
	
	// 플래너 정보 가져오기
	@Override
	public List<PlannerVO> getPlanner(Long plan_No) {
		return mapper.getPlanner(plan_No);
	}

	// 플래너 저장
	@Override
	public void insert(PlannerVO pvo) {
		// TODO Auto-generated method stub
		
	}

	// 플래너 수정
	@Override
	public void update(PlannerVO pvo) {
		// TODO Auto-generated method stub
		
	}

	// 플래너 삭제
	@Override
	public void delete(Long plan_No) {
		// TODO Auto-generated method stub
		
	}


	
	
	
}
