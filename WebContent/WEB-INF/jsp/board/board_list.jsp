<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.spring.board.dao.BoardMapper"%>
<%@ page import="com.spring.board.dao.BoardMapperImpl"%>
<%@ page import="com.spring.board.vo.BoardVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SelectAll</title>
<style>
.table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	text-align: center;
	margin: 0 auto;
	width: 80%;
}

.table tr .table_title {
	font-size: 20px;
	background-color: #eee;
}

.table tr .info_title, .info_button {
	background-color: #f5f5f5;
}

.table tr td {
	padding: 10px;
}

.table tr .info_button {
	text-align: right;
}

.table tr .info_button .btn {
	border: none;
	background-color: #ddd;
	padding: 8px;
	width: 90px;
	box-sizing: border-box;
	cursor: pointer;
}

.table tr .info_button .btn:hover {
	background-color: #222;
	color: #fff;
	transition: all .3s ease;
}

#table {
	margin: 30px auto;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
	$(function() {
		$("#listBtn").click(function() {
			alert("listBtn >>>>> ");
			$("#boardList").attr("action", "/board/listBoard.lsj").submit();
		});
		$("#insertBtn").click(function() {
			alert("insertBtn >>>>> ");
			$("#boardList").attr("action", "/board/selectBoard.lsj").submit();
		});
		$("#updateBtn").click(function() {
			alert("updateBtn >>>>> ");
			$("#boardList").attr("action", "/board/selectBoard.lsj").submit();
		});
		$("#deleteBtn").click(function() {
			alert("deleteBtn >>>>> ");
			$("#boardList").attr("action", "/board/deleteBoard.lsj").submit();
		});
		$("#listSearch").click(function(){
			$("#searchForm").attr("action","/board/listBoard.lsj").submit();
		});
	});
</script>
</head>
<body>
	<form id="boardList" name="boardList" method="POST">
	<%
		Object obj = request.getAttribute("listBoard");
		System.out.println("obj >>> : " + obj);
		if (obj != null) {
			List<BoardVO> list = (ArrayList<BoardVO>) obj;
			if (list.size() == 0) {
	%>
		<table border="1" class="table">
			<tr>
				<td>NO DATA</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table class="table" border="1">
			<thead>
				<tr>
					<td colspan="10" class="table_title">게시판</td>
				</tr>
				<tr>
					<td class="info_title"><input type="checkbox" name="chkAll"
						id="chkAll"></td>
					<td class="info_title">글번호</td>
					<td class="info_title">제목</td>
					<td class="info_title">이름</td>
					<!-- <td class="info_title">비밀번호</td> -->
					<td class="info_title">내용</td>
					<td class="info_title">첨부파일</td>
				</tr>
			</thead>
			<%
				for (int i = 0; i < list.size(); i++) {
							// casting
							BoardVO bvo = (BoardVO) list.get(i);
			%>
			<tbody>
				<tr>
					<td class="info_con"><input type="checkbox" name="lno"
						id="lno" value=<%=bvo.getLno()%> onclick="checkOnly(this)"></td>
					<td class="info_con"><%=bvo.getLno()%></td>
					<td class="info_con"><%=bvo.getLsubject()%></td>
					<td class="info_con"><%=bvo.getLname()%></td>
					<%-- <td class="info_con"><%=bvo.getLpw()%></td> --%>
					<td class="info_con"><%=bvo.getLmemo()%></td>
					<td><img src = "./upload/<%=bvo.getLimage()%>" border=0 width="150" height="100"></td>
				</tr>
				<%
					} //for끝
						} //aList.size if 끝
					} //object if 끝
				%>
				<tr>
					<td colspan="16" class="info_button">
						<input type="button" value="목록" id="listBtn" name="listBtn" class="btn">
						<input type="button" value="쓰기" id="insertBtn" name="insertBtn" class="btn">
						<input type="button" value="수정" id="updateBtn" name="updateBtn" class="btn"> 
						<input type="button" value="삭제" id="deleteBtn" name="deleteBtn" class="btn">
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<div id="form">
		<!-- form -->
		<form id="searchForm" name="searchForm" method="post">
			<!-- div -->
			<div>
				<!-- table -->
				<table id="table">
					<tr>
						<th width="100px">이름검색</th>
						<td><input type="text" id="lname" name="lname"
							style="height: 24px;" /></td>
						<td><input type="button" value="검색" id="listSearch" /></td>
					</tr>
				</table>
				<!-- //table -->
			</div>
			<!-- //div -->
		</form>
		<!-- //form -->
	</div>
</body>
</html>