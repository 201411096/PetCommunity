<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/communityBoardWrite.js"></script>

<title>게시판</title>
</head>
<body>

	<div class="container">
	<header>
			<h1> 게시글 수정하기</h1>
	</header>
	<br/><br/>
		<form action="modifyBoardContent.do" method='get' enctype='multipart/form-data'>			
			<input type="hidden" name="communityboardId" value="${boardContent.communityboardId}">
			<!-- 글쓰기 -->
			<br/><br/>
			<div class="form-group">
				<label>글 제목</label> 
				<input type="text" class="form-control" name="communityboardTitle" id="communityboardTitle" placeholder="title" value="${boardContent.communityboardTitle}">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="5" name="communityboardContent" id="communityboardContent" placeholder="contents">${boardContent.communityboardContent}</textarea>
			</div>
			<div>
				<button type="button" class="btn btn-default" name='imgUpload'>이미지 첨부</button>
			</div>
			<div class="col-md-4 col-md-offset-10">			
			<span class="input-group-btn">
				<button type="butto+n" class="btn btn-default" id='commitWrite'>수정완료</button>
				<button type="button" class="btn btn-default" id='cancelWrite'>수정하기 취소</button>
			</span>
			</div>			
		</form>



		
	</div>
</body>
</html>