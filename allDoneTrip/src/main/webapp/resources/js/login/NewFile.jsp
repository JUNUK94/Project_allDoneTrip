<%-- <%@page import="pack.DB_Manager_user"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
       <%
          request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
         response.setContentType("UTF-8");
      %>
<%-- <%!DB_Manager_user DB = new DB_Manager_user();%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
body {
   font-size: 12px;
}
</style>


<script type="text/javascript">
   function check_form() {
      var privacy_check = sign_form.privacy_agree.checked;
      var terms_check = sign_form.terms_agree.checked;
      var id_length = sign_form.id.value.length;
      if (sign_form.name.value.length == 0) {
         alert('이름을 입력하세요.');
         return false;
      }
      if (sign_form.id.value.length < 5) {
         alert('아이디를 최소 5글자로 입력해주세요.');
         return false;
      }
      if (sign_form.id.value.length > 13) {
         alert('아이디를 최대 13글자로 입력해주세요.');
         return false;
      }
      if (sign_form.pw1.value.length < 6) {
         alert('비밀번호를 최소 6글자로 입력해주세요.');
         return false;
      }
      if (sign_form.pw1.value.length > 20) {
         alert('비밀번호를 최대 20글자로 입력해주세요.');
         return false;
      }
      var check_pw1 = sign_form.pw1.value;
      var check_pw2 = sign_form.pw2.value;
      if (check_pw1 != check_pw2) {
         alert('입력한 비밀번호가 다릅니다.');
         return false;
      }
      var temp = new Array();
      for (var i = 0; i < sign_form.phone.value.length; i++) {
         if (sign_form.phone.value.charAt(i) == '-') {
            alert('-를 입력하지마세요.');
            return false;
         }
      }
         
      if (sign_form.address.value.length < 3) {
         alert('주소를 입력해주세요.');
         return false;
      }
      if (sign_form.D_address.value.length < 3) {
         alert('상세 주소를 입력하세요.');
         return false;
      }
      if (!privacy_check) {
         alert('개인정보 동의를 해주세요.');
         return false;
      }
      if (!terms_check) {
         alert('약관에 동의해 주세요.');
         return false;
      }
      if(sign_form.hh.value == 0){
         alert('중복체크를 하세요');
         return false;
      }
      alert(sign_form.state12.value);  
      if (sign_form.state12.value == 0) {
         alert('번호인증이 되지않았습니다.');
         return false;
      }

   }

   function fcheck_pw() {
      if (!sign_form.pw1.value.equals(sign_form.pw2.value)) {
         alert('입력한 비밀번호가 다릅니다.');
      }
   }
   function certification_phone() {
      
      if (sign_form.phone.value.length == 11) {

         /*var int_value = Number(sign_form.phone.value);*/
         if (isNaN(sign_form.phone.value)) { //문자가있으면 ture
            alert('숫자만 입력해주세요');
            return;
         }
         var user_phone = document.sign_form.phone.value;
         var url = "/EarlyDelivery_TeamProject/SignUp_certification_phone.jsp?phone=" + user_phone;
         var ret = window.open(url,
               "SignUp1.jsp",
               "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=150");
      } else if (sign_form.phone.value.length < 11) {
         alert('핸드폰 번호가 올바르지 않습니다.');
         return false;
      } else if (sign_form.phone.value.length > 11) {
         alert('핸드폰 번호가 올바르지 않습니다.');
         return false;
      }
   }

   function check_id() {
      if (sign_form.id.value.length < 5) {
         alert('아이디를 5~13자리 입력해주세요.');
      }
      if (sign_form.id.value.length > 13) {
         alert('아이디를 5~13자리 입력해주세요.');
      }
   }

   function check_pw() {
      if (sign_form.pw1.value.length < 6) {
         alert('비밀번호를 6~20자리로 입력해주세요.');
      }
      if (sign_form.pw1.value.length > 20) {
         alert('비밀번호를 6~20자리로 입력해주세요.');
      }
   }
   function confirm_id() {
      if (sign_form.id.value.length < 5) {
         alert('아이디를 입력해주세요.');
         <%-- alert('<%=DB_Manager_user.checknumber_id%>'); --%>
         return;
      }
      var form1 = document.sign_form;
      var user_id = form1.id.value;
      var url = "/EarlyDelivery_TeamProject/idcheck.jsp?id=" + user_id;
      var ret = window.open(url,
                  "SignUp.jsp",
                  "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=150");
      return;
   }
</script>
</head>
<body>
   <form name="sign_form" action="SignUp" method="post"
      onsubmit="return check_form()">
      <h2>
         <p align="center">회원가입</p>
      </h2>
      <table style="font-size: 12px; height: 400px; margin:0 auto;">
         <tr>
            <td>이름</td>
            <td><input type="text" name="name"
               placeholder="이름 입력" style="width: 90%;"></td>
         </tr>
         <tr>
            <td>아이디</td>
            <td><input type="text" name="id" placeholder="아이디 최대13자리입력"
               onblur="check_id()" style="width: 90%;"></td>
            <td><input type="button" name="id_button" value="중복체크"
               onclick="confirm_id()"><input type="hidden" name="hh" value ="0"></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw1"
               placeholder="비밀번호를 최대20자리입력" onblur="check_pw()" style="width: 90%;"><br></td>
         </tr>
         <tr>
               <td>비번 확인</td>
               <td><input type="password" name="pw2" placeholder="비밀번호 확인" style="width: 90%;"></td>
         </tr>
         <tr>
            <td>전화번호</td>
            <td width="60%"><input type="text" name="phone" value="010" style="width: 90%;"></td>
            <td><input type="button" value="인증번호" onclick="certification_phone()">
            <input type="hidden" id="state12" name="state12" value="0"></td>
         </tr>
         <tr>
            <td></td>
            <td colspan='2'><font size='1pt' color='gray'>-를 제외하고 입력해주세요</font></td>
         </tr>
         <tr>
            <td>주&emsp;&nbsp;&nbsp;&nbsp;소</td>
            <td>
               <input type="text" name="address" placeholder="주소를 동까지 입력하세요." style="width: 90%;">
            </td>
         </tr>
         <tr>      
            <td>상세주소</td>
            <td>
               <input type="text" name="D_address" placeholder="상세 주소를 입력하세요." style="width: 90%;">
            </td>
         </tr>
         <tr>
            <td></td>
            <td style="font-size:6pt;">개인정보 제공에 동의합니다.
               <input type="checkbox" height="20px" id="privacy_agree" name="privacy_agree" value="" 
               onclick="return check(this)">

            <br>약관에 동의합니다.
               <input type="checkbox" height="20px" id="terms_agree" name="terms_agree" value=""
               onclick="return check(this)">
            </td>
         </tr>
         <tr align="center" height="80px">
            <td colspan="3" width="100%">
               <a href="MAIN_PAGE.jsp">
               <input style="font-size: 25px;" type="button" name="signup" value="취소"></a>
               &emsp;
               <input style="font-size: 25px;" type="submit" name="signup" value="가입">
            </td>
         </tr>
      </table>
   </form>
</body>
</html>