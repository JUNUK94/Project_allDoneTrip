package org.adt.mapper;

import java.util.List;

import org.adt.domain.Criteria;
import org.adt.domain.PlannerVO;

public interface PlannerMapper {

	//�÷��� ����Ʈ ��������
	public List<PlannerVO> getList(Criteria cri);
	
	//�Խñ� ��ü ���� ī��Ʈ
	public int totalCount(Criteria cri);

	//�Խñ� ��ü ����
	public List<PlannerVO> sorting(Criteria cri);
	
}
