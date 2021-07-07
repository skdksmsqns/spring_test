<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글보기</title>

  <!-- Bootstrap 라이브러리 등록 : CND 방식 -> 인터넷이 되어야 한다. -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
#pwDiv{display: none;}
</style>

<script type="text/javascript">
$(function(){
	// 모달 안에 삭제 버튼 이벤트
	$("#modal_deleteBtn").click(function(){

	// alert("modal 삭제");
	$("#modal_form").submit();
	});
});
</script>
</head>
<body>
<div class="container">
	<!-- 제목 -->
	<h1>게시판 글보기</h1>
	<!-- 데이터 테이블 -->
	<table class="table">
		<tr>
			<th>글번호</th>
			<td>${vo.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td><pre style="background: #fff;border: none;font-size: 11pt">${vo.content }</pre></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd" />
  			<fmt:formatDate value="${vo.writeDate }" pattern="hh:mm:ss" />
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.hit }</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="update.do?no=${vo.no }&inc=0&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
					class="btn btn-default">수정</a>
					 <a class="btn btn-default" onclick="return false;" data-toggle="modal" data-target="#myModal">삭제</a>
					<a href="list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
						class="btn btn-default">리스트</a> 
					
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog"></div>
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">×</button>
								<h4 class="modal-title">게시판 글삭제 비밀번호 입력</h4>
							</div>
							<div class="modal-body">
								<form action="delete.do" method="post" id="modal_form">
									<input type="hidden" name="no" value="${vo.no }">
									<div class="form-group">
										<label>비밀번호 : </label> 
										<input name="pw" type="password" class="form-control" id="pw" pattern="[^가-힣ㄱ-ㅎ]{4,20}"
											required="required" title="4-20자. 한글은 입력할 수 없습니다." />
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="modal_deleteBtn">삭제</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
					
				</td>
		</tr>
	</table>
</div>

</body>
</html>