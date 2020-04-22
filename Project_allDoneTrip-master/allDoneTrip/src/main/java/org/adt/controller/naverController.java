package org.adt.controller;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class naverController extends DefaultApi20{
	
	protected naverController(){
		
	}
	
	private static class InstanceHolder{
		
		private static final naverController INSTANCE = new naverController();
		
	}
	
	public static naverController instance(){
		
		return InstanceHolder.INSTANCE;
	
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
		
	}
	
	@Override
	protected String getAuthorizationBaseUrl() {
		
		return "https://nid.naver.com/oauth2.0/authorize";
	
	}
}

