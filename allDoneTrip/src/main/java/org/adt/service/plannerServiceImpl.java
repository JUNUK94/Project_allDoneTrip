package org.adt.service;

import java.util.List;

import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;
import org.adt.mapper.PlannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class plannerServiceImpl implements plannerService {
	
	@Autowired
	private PlannerMapper mapper;
	
	@Override
	public List<PlannerVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}
	
	
	
}
