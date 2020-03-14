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
						alert("���̵� �Է��ϼ���");
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
							$("#chkMsg").html("��밡���� ���̵� �Դϴ�.").css("color","blue").css("text-align","left");
						}else{
							$("#chkMsg").html("�ߺ��� ���̵� �Դϴ�.").css("color","#cf0000").css("text-align","left");
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
					
					// �Է¿��� �˻�
					if(!lpw){
						alert("��й�ȣ�� �Է��ϼ���.");
						$("#lpw").focus();
						return false;
					}
					if(!lpwChck){
						alert("��й�ȣ Ȯ�ζ��� �Է��ϼ���.");
						$("#lpwChck").focus();
						return false;
					}
					
					if(lpw == lpwChck){
						alert("��й�ȣ Ȯ�� �Ϸ�!");
					}else{
						alert("��й�ȣ�� Ȯ���ϼ���.");
						$("#lpw").val("");
						$("#lpwChck").val("");
						$("#lpw").focus();
					}	
				}); // lpwChckBtn
				
				/*insert*/
				$("#insertData").click(function(){
					alert("insertData >>>> ");
					if(confirm('����� �����ұ��?')){
						$("#memberForm").attr("action","/member/insertMem.lsj");
						$("#memberForm").submit();
					}
				});
				
			});
			

		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

		                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
		                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
		                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
		                var extraRoadAddr = ''; // ���� �׸� ����

		                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
		                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
		                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
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
						<td class="info_title">���̵�</td>
						<td class="info_input">
							<input type="text" name="lid" id="lid" placeholder="���̵� �Է��ϼ���" />
							<input type="button" class="btn" id="lidChckBtn" name="lidChckBtn" value="���̵� �ߺ�üũ">
							<span id="chkMsg"></span>
						</td>
						
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">��й�ȣ</td>
						<td class="info_input"><input type="password" name="lpw" id="lpw" placeholder="��й�ȣ�� �Է��ϼ���" /></td>
					</tr>
					<!-- //tr -->
					<tr>
						<td class="info_title">��й�ȣȮ��</td>
						<td class="info_input">
							<input type="password" name="lpwChck" id="lpwChck" placeholder="��й�ȣ Ȯ��" />
							<input type="button" class="btn" id="lpwChckBtn" value="��й�ȣ Ȯ��">
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">�̸�</td>
						<td class="info_input"><input type="text" name="lname" id="lname" placeholder="�̸��� �Է��ϼ���" /></td>
					</tr>
					<!-- //tr -->
					<!-- //tr -->
					<tr>
						<td class="info_title">����</td>
						<td class="info_input">
						<input type="text" name="lgender" id="lgender" placeholder="M or F" />
							<!-- M<input type="radio" name="lgenderM" id="lgenderM" />
							F<input type="radio" name="lgenderF" id="lgenderF" /> -->
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="title info_title">�������</td>
						<td class="info_input">
							<input type="text" name="lbirth" placeholder="YYMMDD">
							<!-- <select name="lbirth" id="lyear" title="�⵵" class=""></select>
							<select name="lbirth" id="lmonth" title="�⵵" class=""></select> -->
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">�̸���</td>
						<td class="info_input">
						<input type="text" name="lemail" placeholder="�̸����� �Է��ϼ���">
							<!-- <input type="text" name="lemail" id="lemail" size="10"> @
							<input type="text" name="lemailDomain" id="lemailDomain" size="10">
							<select name="lemailDomainSlctr" id="lemailDomainSlctr">
								<option value="bySelf">�����Է�</option>
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="daum.net">daum.net</option>
							</select> -->
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">�޴�����ȣ</td>
						<td class="info_input">
						<input type="text" name="lhp" placeholder="������ ���� �Է��ϼ���">
							<!-- <select id="lhp">
							    <option value="">����</option>
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
						<td class="info_title">�����ȣ</td>
						<td class="info_input">
						<!-- input type="text" name="lpostno" placeholder="�����ȣ 5�ڸ�"-->
							<input type="text" id="lpostno" name="lpostno" placeholder="�����ȣ">
							<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
							
						</td>
					</tr>
					<tr>
						<td class="info_title">�ּ�</td>
						<td class="info_input">
							<input type="text" name="ljuso" id="ljuso" placeholder="���θ��ּ�">
							<input type="text" name="ljuso1" id="ljuso1" placeholder="���ּ�">
							
						</td>
						
					</tr>
					<tr>
						<td class="info_title">ȸ������</td>
						<td class="info_input"><input type="file" name="limage" id="limage"></td>
					</tr>
					<!-- tr -->
					<tr>
						<td colspan="2" class="info_button">
							<input type="button" id="insertData" value="���" class="btn" />
							<input type="reset" value="�ٽ�" id="retry" class="btn" />
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