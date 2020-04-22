<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>

<head>
	<!-- Required meta tags -->
	<meta name="viewport" charset="utf-8" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>ALLDONE TRIP</title>

<!--=====================================템플릿=========================================-->

	<link rel="icon" href="/resources/main/img/favicon.png">
	
	<!-- animate CSS -->
	<link rel="stylesheet" href="/resources/main/css/animate.css">
	
	<!-- owl carousel CSS -->
	<link rel="stylesheet" href="/resources/main/css/owl.carousel.min.css">
	
	<!-- themify CSS -->
	<link rel="stylesheet" href="/resources/main/css/themify-icons.css">
	
	<!-- flaticon CSS -->
	<link rel="stylesheet" href="/resources/main/css/flaticon.css">
	
	<!-- fontawesome CSS -->	
	<link rel="stylesheet" 
		href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
		crossorigin="anonymous">
		
	<!-- magnific CSS -->
	<link rel="stylesheet" href="/resources/main/css/magnific-popup.css">
	<link rel="stylesheet" href="/resources/main/css/gijgo.min.css">
	
	<!-- niceselect CSS -->
	<link rel="stylesheet" href="/resources/main/css/nice-select.css">
	
	<!-- slick CSS -->
	<link rel="stylesheet" href="/resources/main/css/slick.css">
	
	<!-- style CSS -->
	<link rel="stylesheet" href="/resources/main/css/style.css">
	
	<!-- poper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	

<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>

<!--================================Ajax Cross Origin===================================-->

	<script src="${contextPath}/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script>

<!--===================================bootstrap========================================-->

	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous">
	
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

<!--==================================google map api====================================-->

<script src="https://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM&libraries=places"></script>

<!--====================================================================================-->

</head>

<body>
	<!-- header -->
	<jsp:include page="header.jsp"/>
	<!-- header end-->
	
	<!-- body -->
	<jsp:include page="${page}"/>
	<!-- body end-->

	<!-- footer-->
	<jsp:include page="footer.jsp" />
	<!-- footer end-->

<!--====================================================================================-->

	<!-- popper js -->
	<script src="/resources/main/js/popper.min.js"></script>
	
	<!-- magnific js -->
	<script src="/resources/main/js/jquery.magnific-popup.js"></script>
	
	<!-- swiper js -->
	<script src="/resources/main/js/owl.carousel.min.js"></script>
	
	<!-- masonry js -->
	<script src="/resources/main/js/masonry.pkgd.js"></script>
	
	<!-- masonry js -->
	<script src="/resources/main/js/jquery.nice-select.min.js"></script>
	<script src="/resources/main/js/gijgo.min.js"></script>
	
	<!-- contact js -->
	<script src="/resources/main/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/main/js/jquery.form.js"></script>
	<script src="/resources/main/js/jquery.validate.min.js"></script>
	<script src="/resources/main/js/mail-script.js"></script>
	<script src="/resources/main/js/contact.js"></script>
	
	<!-- custom js -->
	<script src="/resources/main/js/custom.js"></script>
</body>

</html>