package org.adt.service;

import java.util.List;

import org.adt.domain.PlannerVO;
import org.adt.domain.Criteria;

public interface plannerService {
	
	//�÷��� ����Ʈ ��������
	public List<PlannerVO> getList(Criteria cri);
	
	//�Խñ� ��ü ���� ī��Ʈ
	public int totalCount(Criteria cri);
	
	//�Խñ� ��ü ����
	public List<PlannerVO> sorting(Criteria cri);
}
