<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Index</title>
		<style>
			* {margin:0; padding:0; text-decoration: none;}
			body {background-color:#eee;}
			.wrap {width:100%; height:100%;}
			.wrap header {background-color:#eee; text-align:center;}
			header #header h2 {padding:40px 0;}
			section {background-color:#f5f5f5; min-height:500px; position:relative; }
			section .button a, #listSearch {display:inline-block; width:160px; line-height:2.5; text-align:center; background-color:#ddd; color:#222;}
			section .button a:hover, #listSearch:hover {background-color:#555; transition: all .3s ease; color:#f5f5f5;}
			#form {position: absolute; bottom: 50px; left: 50%; transform: translateX(-50%);}
			#listSearch {border:0; width:80px;}
			iframe {width:100vw; height:100vh;}
			footer {background-color:#eee;}
			footer #footer p {text-align:center; padding:30px 0;}
			
			* {margin: 0; padding: 0;}
			body{width:100%; height:100%; background-color:#f5f6f7;}
			.login-contents {width: 700px; margin: 100px auto 0;}
			h2 { font-size:30px; text-align: center; text-transform: uppercase; color:#333;}
			#loginForm {text-align:center; margin:30px auto 0; }
			input {margin:10px 0; padding:3px; width: 300px; height: 45px; box-sizing: border-box;}
			.button, #joinBtn{width: 300px; padding:10px 0; box-sizing: border-box; display:block; margin: 10px auto; border: none; background-color:#333; color:#f5f5f5;}
			.button:hover, #joinBtn:hover {cursor:pointer; background-color:#aaa; color:#333; transition:all .3s ease; }
			
		</style>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script>
		$(function(){
			$("#listSearch").click(function(){
				$("#searchForm").attr("action","/member/listMem.lsj");
				$("#searchForm").submit();
			});
			$("#loginData").click(function(){
				alert("LOGIN click >>>");
				$("#loginForm").attr("action","/member/loginMem.lsj").submit();
			});	
		});
		</script>
	</head>
	<body>
		<!-- wrap -->
		<div class="wrap">
			<!-- header -->
			<header>
				<!-- #header -->
				<div id="header">
					<h2>SUJIN</h2>
				</div>
				<!-- #header -->
			</header>
			<!-- header -->
			<!-- section -->
			<section>
				<!-- <iframe width="100%" height="800" src="https://www.youtube.com/embed/uCN-092Smf0?autoplay=1&mute=1&controls=0&showinfo=0&amp;start=60" frameborder="0" 
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
				<!-- <div class="button">
					<a href="" title="로그인">로그인</a>
					<a href="/member/selectMem.lsj" title="회원가입" id="joinBtn">회원가입</a>
					<a href="/member/listMem.lsj" title="전체조회">전체조회</a>
					<a href="#" title="게시판">게시판</a>
				</div>login-contents
				 -->
				<!-- login-contents end -->
				<div class="login-contents">
					<!-- Login title -->
					<h2>Login</h2>
					
					<form id="loginForm" name="loginForm" method="POST" enctype="application/x-www-form-urlencoded">
						
						<!-- 아이디/비밀번호 -->
						<input type="text" name="lid" placeholder=" 아이디를 입력하세요." id="lid"><br>
						<input type="password" name="lpw" placeholder=" 비밀번호를 입력하세요." id="lpw"><br>
						
						<!-- 보내기 	-->		
						<input type="button" value="LOGIN" class="button" id="loginData" name="loginData"></input>
						<a href="/member/selectMem.lsj" title="회원가입" id="joinBtn">회원가입</a>
						<a href="/board/listBoard.lsj" title="게시판" id="boardBtn">게시판</a>
						<!-- <input type="reset" value="RETRY" class="button"></input>  -->
						
					</form>
					<!-- form end -->
				</div>
				<!-- login-contents end -->
				
				<div id="form">
					<!-- form -->
					<form id="searchForm" name="searchForm" method="post">
						<!-- div -->
						<div>
							<!-- table -->
							<table id="table">
								<tr>
									<th width="100px">이름검색</th>
									<td>
										<input type="text" id="lname" name="lname" style="height: 24px;" />
									</td>
									<td>
										<input type="button" value="검색" id="listSearch" />
									</td>
								</tr>
							</table>
							<!-- //table -->
						</div>
						<!-- //div -->
					</form>
					<!-- //form -->
				</div>
			</section>
			<!-- section -->
			<!-- footer -->
			<footer>
				<!-- #footer -->
				<div id="footer">
					<p>@Copyright 2020 LeeSujin</p>
				</div>
				<!-- #footer -->
			</footer>
			<!-- footer -->
		</div>
		<!-- wrap -->
	</body>
</html>