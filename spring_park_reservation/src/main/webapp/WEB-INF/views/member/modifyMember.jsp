<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${requestScope.pwCheck ne true}">
	<script>
		alert('정보 보호를 위해 패스워드 확인이 필요합니다');
		document.location.href="userPasswordCheck";
	</script>
</c:if>




<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/listOne.css">


</head>
<body>


<div class="navbar">
  <a href="home">홈</a>
  <a href="reservation?pn=kaya">예약하기</a>
  

  
  <div class="dropdown">
    <button class="dropbtn">알림마당 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="notice">공지사항</a>
      <a href="question">문의하기</a>
      <a href="visit">방문후기</a>
    </div>
  </div>
  <a href="history">나의 예약 내역</a>
  
  <c:if test="${sessionScope.sessionRole eq 'admin'}">
  	<div class="dropdown">
  		<button class="dropbtn">관리자 메뉴
  			<i class="fa fa-caret-down"></i>
  		</button>
  		<div class="dropdown-content">
  			<a href="memberlist">회원 관리</a><a href="reservationManage">예약 관리</a>
  		</div>
  	</div>
  </c:if>
  

  <a href="listOne" style="float:right;">마이페이지</a>
  
  <c:if test="${empty sessionScope.sessionId }">
  	<a href="login" style="float:right;">로그인</a>
  	<script>
  		alert('로그인이 필요한 서비스입니다. \n로그인 페이지로 이동하시겠습니까?')
  		document.location.href="login";
  	</script>
  </c:if>
  
  <c:if test="${!empty sessionScope.sessionId  }">
  	<a href="logout" style="float:right">로그아웃</a>
  	<a href='#' onclick="return false" style="float:right;"><%= session.getAttribute("sessionId") %>님 안녕하세요</a>
  </c:if>
</div>
<div class="space">
	<img src="https://user-images.githubusercontent.com/73692337/105316214-eb767b80-5c03-11eb-9af8-7631150565f0.png">
</div>
<div class="sidenav">
	<div class="menubar">
		마이페이지
	</div>
  <a href="listOne">기본 회원 정보</a>
  <a href="modifyMember.do"  class="select">회원 정보 수정</a>
  <a href="signOut" >회원 탈퇴</a>

</div>

	<div class="center">
	<form action="modifyProcess" method="post">
 		<table class="memberOne">
 			<tr>
 				<th>아이디</th>
 				<td>${member.username }</td>
 				<td><input type="hidden" name="username" value="${member.username }"></td>
 			</tr>
 			<tr>
 				<th>이름</th>
 				<td><input type="text" name="name" value="${member.name }" required></td>
 			</tr>
 			<tr>
 				<th>패스워드</th>
 				<td><input type="password" name="pw" required></td>
 			</tr>
 			<tr>
 				<th>이메일</th>
 				<td><input type="email" name="email" value="${member.email }" required></td>
 			</tr>
 			<tr>
 				<th>전화번호</th>
 				<td><input type="text" name="phone_1" value="${member.phone_1 }" style="width:20%" required>
 				 - <input type="text" name="phone_2" style="width:20%" required>
 				 - <input type="text" name="phone_3" style="width:20%" required></td>
 			</tr>
 		</table>
 		<div class="modifyButtonDiv">
 			<button type="submit">회원정보 수정</button>
 		</div>
 		</form>
	</div>




<div class="footer">
</div>


</body>
</html>
