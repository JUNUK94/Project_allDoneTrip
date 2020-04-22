package org.adt.domain;

import java.util.ArrayList;

public class Name_National {
	
	ArrayList<String> Name_USA;		//크롤링
	String paris = "1014_paris";
	String newwork = "1021_newyork";
	String jeju = "1026_jeju";
	
	
	public Name_National() {
		// TODO Auto-generated constructor stub
		Name_USA = new ArrayList<String>();
	}
	
	ArrayList<String> getNameUSA(){
		return Name_USA;
	}
	void setNameUSA(String str){
		Name_USA.add(str);
	}
	
}
