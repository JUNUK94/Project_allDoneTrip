package org.adt.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class CityDTOList {	//도시정보를 불러올 객체 리스트


	
	private List<CityDTO> list;
	
	public CityDTOList() {
		list = new ArrayList<>();
	}
}
