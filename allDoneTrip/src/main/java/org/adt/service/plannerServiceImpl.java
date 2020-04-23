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
			
			mapper.addClickNum(plan_No);
		}
	}
	
	
	// 좋아요 사전 체크여부 판별 후 좋아요 추가
	@Override
	public boolean addLike_afterCheck(PlannerVO pvo) {
		
		//플래너 게시판 번호, 이메일로 좋아요를 눌렀는지 판단
		int check = mapper.check_User(pvo);
		
		//좋아요를 누르지 않았으면
		if(check == 0) {
			mapper.addLike(pvo);	//planner DB에 좋아요+1로 업데이트
			mapper.addLike_insertUser(pvo); //planner_Like DB에 게시판번호, 이메일 추가
			return true;
		}else {
			return false;
		}
	}
	
	
	// 플래너 정보 가져오기
	@Override
	public List<PlannerVO> getPlanner(Long plan_No) {
		return mapper.getPlanner(plan_No);
	}

	// 플래너 저장
	@Override
	public long save(PlannerVO pvo) {
		return mapper.save(pvo);
	}


	// 플래너 수정
	@Override
	public void update(PlannerVO pvo) {
		mapper.update(pvo);
	}

	// 플래너 게시판에 등록
	@Override
	public void register(PlannerVO pvo) {
		// TODO Auto-generated method stub
		
	}
	
	
	// 플래너 삭제
	@Override
	public void delete(Long plan_No) {
		
	}


	@Override
	public List<PlannerVO> getUsersPlanner(String email) {
		return mapper.getUsersPlanner(email);
	}


	@Override
	public List<PlannerVO> get_Popular_PlannerList() {
		return mapper.get_Popular_PlannerList();
	}






	
}
