package org.adt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.domain.PlannerVO;
import org.adt.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.apache.commons.lang3.StringUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper bMapper;

	//게시판전체목록 가져오기
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return bMapper.getBoardList(cri);
	}
	
	//특정 게시글 조회
	@Override
	public BoardVO get(Long bno) {
		return bMapper.read(bno);
	}
	
	//게시글 조회 이력 확인
	@Override
	public void checkCookie(HttpServletResponse response, HttpServletRequest request, Long bno) {
		Cookie cookies[] = request.getCookies();
		Map mapCookie = new HashMap();
		
		log.info(bno);
		
		if(request.getCookies() != null){
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				mapCookie.put(obj.getName(),obj.getValue());
			}
		}

		String cookie_read_count = (String) mapCookie.get("read_count");
		String new_cookie_read_count = "|" + bno;
		
		if (StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1 ) {
			Cookie cookie = new Cookie("read_count", cookie_read_count + new_cookie_read_count); 
			response.addCookie(cookie); 
			
			log.info(bno);
			bMapper.addBclickNum(bno);
			log.info("조회수 추가");
		}
	}
		
	//게시판 전체 갯수
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return bMapper.getTotalCount(cri);
	}

	//게시판글작성
	@Override
	public int Insert(BoardVO board) {
		// TODO Auto-generated method stub
		return bMapper.reviewInsert(board);
	}
		
	//글수정
	@Override
	public boolean update(BoardVO board) {
		return false;
	}
		
	//글삭제
	@Override
	public boolean delete(Long bno) {
		return false;
	}

	@Override
	public void addclick(long bno) {
		// TODO Auto-generated method stub
		bMapper.addBclickNum(bno);
	}

	
}