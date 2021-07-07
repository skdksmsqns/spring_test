<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageObject" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#cancelBtn").click(function () {
		history.back();
	})
});
</script>

</head>
<body>
	<div class="container">
		<h1>게시판 글수정</h1>
		<form method="post" class="form-group">
		<!-- 숨겨서 넘길 데이터: 페이지 관련 데이터 스프링 param 데이터를 잡아서 넘겨주는듯-->
		<%-- <input name="page" type="hidden" value="${param.page }"/> --%>
		<%-- <input name="perPageNum" type="hidden" value="${param.perPageNum }"/> --%>
		<%-- <input name="key" type="hidden" value="${param.key }"/> --%>
		<%-- <input name="word" type="hidden" value="${param.word }"/> --%>
			<table class="table">
				<tr>
					<th>글번호</th>
					<td><input class="form-control" name="no" value="${vo.no }" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="form-control" name="title" value="${vo.title }"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" class="form-control" name="content" >${vo.content }</textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input class="form-control" name="writer" value="${vo.writer }"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="form-control" name="pw" type="password"/></td>
				</tr>

				<tr>
					<td colspan="2">
						<button class="btn btn-default">수정</button>
						<button class="btn btn-default" type="reset">다시입력</button>
						<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>