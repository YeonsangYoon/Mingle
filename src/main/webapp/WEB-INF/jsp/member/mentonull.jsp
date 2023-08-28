<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

<div class="mentonull">

	<div class="nullInfo">
		아직 멘토가 아니시군요!<br> 
		<span style="color: #bc35ff;">등록하러</span> 가시겠어요?
	</div> 
	
	<div style="display: flex; justify-content: center; margin: 50px 0px;">
		<div class="nullLink">
			<a href="${pageContext.request.contextPath}/mento/mento_regist.do">멘토 등록 하러 가기!</a>
		</div>
	</div>
</div>

</body>
</html>