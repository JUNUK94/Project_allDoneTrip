<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crop Box</title>
</head>
<body>
	<div id="HTMLtoPDF">
		한창현입니다.HTMLtoPDF
		https://i.imgur.com/OLa7yJF.jpeg
		<img src="
		http://alldonetrip.shop/resources/img/basic/main/main_Banner6.jpg" width="200px">
		
		
	</div>
	
	<a href="#" onclick="pdfPrint()">down</a>
	<script src="${contextPath}/resources/main/jspdf.js"></script>
	<script src="${contextPath}/resources/main/jquery-2.1.3.js"></script>
	<script src="${contextPath}/resources/main/bluebird.min.js"></script>
	<script src="${contextPath}/resources/main/html2canvas.min.js"></script>
	
	<script>
	/*
		function pdfPrint(){
	        // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
	        html2canvas(document.getElementById('HTMLtoPDF'), {
	        	useCORS: true, onrendered: function(canvas) {
		               canvas.toBlob(function(blob) {
		                   saveAs(blob, 'download.pdf');
		               });
		           }
	           });
		}
		*/
		function pdfPrint(){
	        // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
	        html2canvas(document.getElementById('HTMLtoPDF'), {
	        	proxy: "https://alldonetrip.shop",
	        	letterRendering: 1,
	        	allowTaint : false,
	        	useCORS :  true,
	            onrendered: function (canvas) {
					
	                // 캔버스를 이미지로 변환
	                var imgData = canvas.toDataURL('image/png');
	
	                var margin = 10;	
	                var imgWidth = 190; // 210-(margin*10) = 190mm
	                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	                var imgHeight = canvas.height * imgWidth / canvas.width;
	                var heightLeft = imgHeight;
					var position = 0;
					
	                var doc = new jsPDF('p', 'mm');
	
	                // 첫 페이지 출력
	                doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	                heightLeft -= pageHeight;
	
	                // 한 페이지 이상일 경우 루프 돌면서 출력
	                while (heightLeft >= 20) {
	                    position = heightLeft - imgHeight;
	                    doc.addPage();
	                    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	                    heightLeft -= pageHeight;
	                }
	
	                // 파일 저장
	                doc.save('sample.pdf');
	
	                //이미지로 표현
	                //document.write('<img src="'+imgData+'" />');
	            }
	        });
	    }
		
	</script>
</body>
</html>

