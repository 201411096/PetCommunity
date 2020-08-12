<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css" />
<link rel="stylesheet" href="./resources/css/qnaBoardWrite.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<title>게시판</title>
</head>
<body>
	<div class="container">
		<div id="qnaTitle">
			<h4>공지 작성하기</h4>
		</div>
		<br />
		<br />
		<form action="notice.do" class="NoticeBoard-form" method='post' name="NoticeBoardBtn" enctype="multipart/form-data">

			<!-- 글쓰기 -->
			<br />
			<br />
			<div class="form-group">
				<p>글 제목</p> <input type="text" class="form-control"
					name="questionboardTitle" id="questionboardTitle"
					placeholder="제목">
			</div>
			<div class="form-group">
				<p>글 내용</p>
				<textarea class="form-control" rows="5" name="questionboardContent"
					id="questionboardContent" placeholder="내용을 입력해주세요."></textarea>
			</div>
				<label>memberId : ${member.memberId}<br> 
				</label>
				<input type="hidden" name="memberId"
				id="memberId" value="${membervo.memberId}">
				<input type="hidden" name="questionboardReadcount"
				id="questionboardReadcount" value="0">
				<input type="hidden" name="questionboardAnswerflag"
				id="questionboardAnswerflag" value="-1">
				<input type="hidden" name="questionboardGroupId"
				id="questionboardGroupId" value="99999">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default" id='NoticeBoardBtn'>작성완료</button>
					<a class="btn btn-default" id='cancelWrite' href="/petcommunity/cs.do">돌아가기</a>
				</span>
		</form>
	</div>

</body>
</html>
<%@include file="../views/footer.jsp"%>