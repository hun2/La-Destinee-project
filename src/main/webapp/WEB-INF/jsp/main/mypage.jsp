<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>La destinee</title>
	<!-- jquery : ajax, bootstrap, datepicker -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- material icons -->
	<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
	
	<!-- css -->
	<link href="/static/css/main.css" rel="stylesheet" />
</head>
<body>
	<div class="main-wrap">
	
		<!-- navigation -->
		<jsp:include page="../include/nav.jsp" />
		
		<!-- contents -->
		<section class="content-area">
			<div class="container">
				<!-- content -->
				<div class="content">
					<!-- 내정보 영역 -->
					<div class="mypage-profile-area">
						<!-- 프로필이미지 -->
						<div class="img-box">
							<img src="${empty sessionScope.loginUser.profilephoto ? '/static/img/no.png' : sessionScope.loginUser.profilephoto}" class="profilephoto" alt="프로필사진">
						</div>
						<!-- 내정보 -->
						<div class="info-box">
							<!-- 닉네임/아이디 -->
							<div class="info top">
								<div class="nickname">${user.nickname}</div>
								<div class="loginid">${user.loginid}
								<!-- 일반계정이 아닐 경우 로그인한 소셜명 노출 -->
								<c:if test="${user.path != '일반'}"><span>(${user.path}계정)</span></c:if>
								</div>
							</div>
							<!-- 생년월일/성별/지역 -->
							<div class="info middle">
								<div class="birth"><c:if test="${empty user.birth}">생년월일(미설정)</c:if> <fmt:formatDate value="${user.birth}" pattern="yyyy/MM/dd" /></div>
								<div class="gender">${user.gender}</div>
								<div class="area">${empty user.area ? '지역(미설정)' : user.area}</div>
							</div>
							<!-- 핸드폰번호/이메일 -->
							<div class="info bottom">
								<input type="hidden" id="userPhonenumber" value="${user.phonenumber}">
								<div class="phonenumber">
									<div class="first"></div>
									<span>-</span>
									<div class="second"></div>
									<span>-</span>
									<div class="third"></div>
								</div>
								<div class="email">${user.email}</div>
							</div>
						</div> <!-- 내정보 끝 -->
					</div> <!-- 내정보 영역 끝 -->
					
					<!-- 소개영역 -->
					<div class="mypage-intro-area intro">${user.intro}</div>
					
					<!-- 버튼영역 -->
					<div class="mypage-btn-area">
						<a href="/mypage/user" class="btn btn-custom">내정보 수정</a>
						<a href="/mypage/pwd" class="btn btn-secondary ml-2">비밀번호 변경</a>
					</div>
					
				</div> <!-- content 끝 -->
			</div>
		</section>
		
		<!-- footer -->
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>

<script>
$(document).ready(function() {
	// 핸드폰번호 자르기
	let userPhonenumber = $('#userPhonenumber').val();
	let first = userPhonenumber.substring(0,3);
	let second = userPhonenumber.substring(3,7);
	let third = userPhonenumber.substring(7,11);
	
	$('.phonenumber > .first').text(first);
	$('.phonenumber > .second').text(second);
	$('.phonenumber > .third').text(third);
});
</script>
</html>