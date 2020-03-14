<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> --%>
<%@ page import="java.util.*" %>
<%
	//encoding
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertMem</title>
		<style>
			.table {border:1px solid #ccc; width:500px; margin:0 auto; border-collapse:collapse; font-size:13px;}
			.table tr {border:1px solid #ddd; height: 40px;}
			.table tr:nth-child(odd) {background-color:#f3f3f3;}
			.table .table_title {text-align:center; font-size:15px;}
			.table tr td {padding:15px 0;} 
			.table tr .info_title {text-align:center; }
			.table tr .info_input {padding: 15px 20px; border-left:1px solid #ddd;}
			.table tr .info_input input {padding:5px; box-sizing:border-box; width: 65%; border: 1px solid #ccc;}
			.table tr .info_input .btn {padding:5px; box-sizing:border-box; width: 30%; border: 1px solid #ccc;}
			.table tr .info_input span {display:block; font-size:11px; line-height:2; padding-top: 5px; text-align:right;}
			.table tr .info_button {text-align:center;}
			.table tr .info_button .btn{ border:none; background-color:#ddd; padding: 8px; width: 90px; box-sizing: border-box; cursor:pointer;}
			.table tr .info_button .btn:hover {background-color:#222; color:#fff; transition: all .3s ease;}
			.table tr .info_button .btn#retry {background-color:#cf0000; color:#fff;}
		</style>

		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			$(function(){
				$("#lidChckBtn").click(function(){
					alert("lidChckBtn >>>");
					var lidVal = $("#lid").val();
					
					if(!lidVal){
						alert("아이디를 입력하세요");
						$("#lid").focus();
						return false
					}
					
					callIdCheck();
				}); // lidChckBtn
				
				
			
			    function callIdCheck(){
					var lid = $("#lid").val();
					console.log(lid);
					$.ajax({
						type		 : "POST",
						url			 : "idCheck.lsj",
						
						data		 : {
							lid		 : lid
						},
						success		 : whenSuccess,
						error		 : whenError
					});
					
					function whenSuccess(data){
						if(data == "true"){
							$("#chkMsg").html("사용가능한 아이디 입니다.").css("color","blue").css("text-align","left");
						}else{
							$("#chkMsg").html("중복된 아이디 입니다.").css("color","#cf0000").css("text-align","left");
						}
					}
					
					function whenError(e){
						alert("Error");
					}
				}
				
				$("#lpwChckBtn").click(function(){
					alert("lpwChck >>>");
					var lpw = $("#lpw").val();
					var lpwChck = $("#lpwChck").val();
					
					// 입력여부 검사
					if(!lpw){
						alert("비밀번호를 입력하세요.");
						$("#lpw").focus();
						return false;
					}
					if(!lpwChck){
						alert("비밀번호 확인란을 입력하세요.");
						$("#lpwChck").focus();
						return false;
					}
					
					if(lpw == lpwChck){
						alert("비밀번호 확인 완료!");
					}else{
						alert("비밀번호를 확인하세요.");
						$("#lpw").val("");
						$("#lpwChck").val("");
						$("#lpw").focus();
					}	
				}); // lpwChckBtn
				
				/*insert*/
				$("#insertData").click(function(){
					alert("insertData >>>> ");
					if(confirm('등록을 진행할까요?')){
						$("#memberForm").attr("action","/member/insertMem.lsj");
						$("#memberForm").submit();
					}
				});
				
			});
			

		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('lpostno').value = data.zonecode;
		                document.getElementById("ljuso").value = roadAddr;
		                

		                document.getElementById("ljuso1").focus();
		            }
		        }).open();
		    }

		</script>
	</head>
	<body>
		<!-- wrap -->
		<div class="wrap">
			<!-- form -->
			<form id="memberForm" name="memberForm" method="POST" enctype="multipart/form-data">
				<!-- table -->
				<table class="table">
					<!-- tr -->
					<tr>
						<td class="info_title">아이디</td>
						<td class="info_input">
							<input type="text" name="lid" id="lid" placeholder="아이디를 입력하세요" />
							<input type="button" class="btn" id="lidChckBtn" name="lidChckBtn" value="아이디 중복체크">
							<span id="chkMsg"></span>
						</td>
						
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">비밀번호</td>
						<td class="info_input"><input type="password" name="lpw" id="lpw" placeholder="비밀번호를 입력하세요" /></td>
					</tr>
					<!-- //tr -->
					<tr>
						<td class="info_title">비밀번호확인</td>
						<td class="info_input">
							<input type="password" name="lpwChck" id="lpwChck" placeholder="비밀번호 확인" />
							<input type="button" class="btn" id="lpwChckBtn" value="비밀번호 확인">
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">이름</td>
						<td class="info_input"><input type="text" name="lname" id="lname" placeholder="이름을 입력하세요" /></td>
					</tr>
					<!-- //tr -->
					<!-- //tr -->
					<tr>
						<td class="info_title">성별</td>
						<td class="info_input">
						<input type="text" name="lgender" id="lgender" placeholder="M or F" />
							<!-- M<input type="radio" name="lgenderM" id="lgenderM" />
							F<input type="radio" name="lgenderF" id="lgenderF" /> -->
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="title info_title">생년월일</td>
						<td class="info_input">
							<input type="text" name="lbirth" placeholder="YYMMDD">
							<!-- <select name="lbirth" id="lyear" title="년도" class=""></select>
							<select name="lbirth" id="lmonth" title="년도" class=""></select> -->
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">이메일</td>
						<td class="info_input">
						<input type="text" name="lemail" placeholder="이메일을 입력하세요">
							<!-- <input type="text" name="lemail" id="lemail" size="10"> @
							<input type="text" name="lemailDomain" id="lemailDomain" size="10">
							<select name="lemailDomainSlctr" id="lemailDomainSlctr">
								<option value="bySelf">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="daum.net">daum.net</option>
							</select> -->
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">휴대폰번호</td>
						<td class="info_input">
						<input type="text" name="lhp" placeholder="하이픈 없이 입력하세요">
							<!-- <select id="lhp">
							    <option value="">선택</option>
							    <option value="011">011</option>
							    <option value="016">016</option>
							    <option value="017">017</option>
							    <option value="019">019</option>
							    <option value="010">010</option>
							</select>
							<input type="text" id="lhp2" size="4" onkeypress="onlyNumber();" />
							<input type="text" id="lhp3" size="4" />
							 -->
						</td>
					</tr>
					<!-- //tr -->
					<tr>
						<td class="info_title">우편번호</td>
						<td class="info_input">
						<!-- input type="text" name="lpostno" placeholder="우편번호 5자리"-->
							<input type="text" id="lpostno" name="lpostno" placeholder="우편번호">
							<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							
						</td>
					</tr>
					<tr>
						<td class="info_title">주소</td>
						<td class="info_input">
							<input type="text" name="ljuso" id="ljuso" placeholder="도로명주소">
							<input type="text" name="ljuso1" id="ljuso1" placeholder="상세주소">
							
						</td>
						
					</tr>
					<tr>
						<td class="info_title">회원사진</td>
						<td class="info_input"><input type="file" name="limage" id="limage"></td>
					</tr>
					<!-- tr -->
					<tr>
						<td colspan="2" class="info_button">
							<input type="button" id="insertData" value="등록" class="btn" />
							<input type="reset" value="다시" id="retry" class="btn" />
						</td>
					</tr>
					<!-- //tr -->
				</table>
				<!-- //table -->
			</form>
			<!-- //form -->
		</div>
		<!-- //wrap -->
	</body>
</html>