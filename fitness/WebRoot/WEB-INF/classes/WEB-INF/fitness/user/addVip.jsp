<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加会员</title>
</head>
<body>
身份证号：<input type="text" id="idNo" ><button onclick="chaxun()">查询</button>
<div style="display: none" id="div">
<input type="text" id="uname" >
<input type="text" id="certifyno" >
<input type="text" id="tel" >
<input type="text" id="vipcardid" >
<input type="text" id="viptime" ><span>请输入例：20171023格式</span>
<button onclick="addvip()">升级会员</button>
</div>
</body>
 <jsp:include page="/main/jslink.jsp"></jsp:include>
<script type="text/javascript">
function chaxun(){
	var idNo = $("#idNo").val();
	$.ajax({
		type : 'POST',
		dataType : 'json',
		async:'false',
		url : "<%=request.getContextPath() %>/vip/tovipcode.do",
		data:{
			idNo : idNo
		},
		success : function(data) {
			alert(data.user.uname);
			$("#uname").val(data.user.uname);
			$("#certifyno").val(data.user.certifyno);
			$("#tel").val(data.user.tel);
		}
	});
	$("#div").show();
	alert($("#idNo").val());
}
function addvip(){
	var vipcardid = $("#vipcardid").val();
	var viptime = $("#viptime").val();
	var certifyno = $("#certifyno").val();
	location.href="<%=request.getContextPath() %>/vip/addvip.do?vipcardid="+id+"&viptime="+viptime+"&certifyno="+certifyno;
}
</script>
</html>