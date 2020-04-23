<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>아아디/비밀번호 찾기</h2>
                            <p>allDone search</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
	${msg1} <br> ${searchResult} ${msg2}<br>
	<a href="/login/loginMain"><button>로그인 하러가기</button></a>
</body>
</html>