/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

var width = document.getElementById("width").value;
//console.log(width);

CKEDITOR.editorConfig = function( config ) {

	config.language = 'ko';
	config.width = width;
	config.enterMode = CKEDITOR.ENTER_BR;	// 줄바꿈 시 <p> -> <br>
	config.startupFocus = true;				// 시작시 포커스 설정
	config.allowedContent = true;			// 기본적인 html이 필터링으로 지워지는데 필터링을 하지 않는다.
	config.docType = "<!DOCTYPE html>";		//문서타입 설정

	
	
	config.pasteFromWordRemoveFontStyles = false;	//워드에서 붙여넣기 시 문자 스타일 유지
	
	config.spreadsheet_licenseKey = '67Gn/ccajt8HqAe6ISOxvFLS3VuCdhWHiKWsSvBTtJgRVOqyoSnOBpwiVPfmdpn0CXKykieFQVsEcjCNj39tPDf6YmacQx277AZYwFIR4nHCDAU0ULqRnHecxzCTgEOQMRdqpk0ettsJSxUNe0OXzFAUKQ=='
	
	
	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
    config.filebrowserBrowseUrl = "/CKEditorSample/ckfinder/ckfinder.html";
    config.filebrowserFlashBrowseUrl = "/CKEditorSample/ckfinder/ckfinder.html?type=Flash";
    
    //파일 업로드 경로 (설정하면 업로드 플러그인에 탭이생김)
    config.filebrowserUploadUrl = "/CKEditorSample/ckfinder/core/connector/java/connctor.java?command=QuickUpload&type=Files";
 
    //이미지 업로드 경로 (설정하면 업로드 플러그인에 탭이생김)
    config.filebrowserImageUploadUrl = "/CKEditorSample/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images";
    
    //플래쉬 업로드 경로 (설정하면 업로드 플러그인에 탭이생김)	
    config.filebrowserFlashUploadUrl = "/CKEditorSample/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash";	
};
