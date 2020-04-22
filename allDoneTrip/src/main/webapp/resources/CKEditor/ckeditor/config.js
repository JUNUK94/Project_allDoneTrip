/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {

	config.language = 'ko';
	//config.width = width;
	config.enterMode = CKEDITOR.ENTER_BR;	// 줄바꿈 시 <p> -> <br>
	config.startupFocus = true;				// 시작시 포커스 설정
	//config.allowedContent = true;			// 기본적인 html이 필터링으로 지워지는데 필터링을 하지 않는다.
	config.docType = "<!DOCTYPE html>";		//문서타입 설정
	config.basicEntities = false;
	config.entities_greek = false; 
	config.entities_latin = false; 
	config.entities_additional = '';
	config.fillEmptyBlocks = false;
	config.autoparagraph = false
	
	
	config.pasteFromWordRemoveFontStyles = false;	//워드에서 붙여넣기 시 문자 스타일 유지
	
	config.extraPlugins = 'uploadimage';
	config.extraPlugins = 'uploadwidget';
	config.extraPlugins = 'notificationaggregator';
	config.extraPlugins = 'notification';
	config.extraPlugins = 'filetools';
	config.extraPlugins = 'button';
	config.extraPlugins = 'widget';
	config.extraPlugins = 'balloontoolbar';
	config.extraPlugins = 'balloonpanel';
	config.extraPlugins = 'dialog';
	config.extraPlugins = 'dialogui';
	config.extraPlugins = 'colordialog';
	config.extraPlugins = 'mentions';
	config.extraPlugins = 'autocomplete';
	config.extraPlugins = 'textwatcher';
	config.extraPlugins = 'textmatch';
	config.extraPlugins = 'ajax';
	config.extraPlugins = 'xml';
	config.extraPlugins = 'spreadsheet';	
		
	config.spreadsheet_licenseKey = '67Gn/ccajt8HqAe6ISOxvFLS3VuCdhWHiKWsSvBTtJgRVOqyoSnOBpwiVPfmdpn0CXKykieFQVsEcjCNj39tPDf6YmacQx277AZYwFIR4nHCDAU0ULqRnHecxzCTgEOQMRdqpk0ettsJSxUNe0OXzFAUKQ=='

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
};
