<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${loginUser.ucid!=1 }">
	<h1>欢迎：${loginUser.userName }登录</h1>
	</c:if>
	<c:if test="${loginUser.ucid==1 }">
	<h1>你不是管理员！！！！</h1>
	</c:if>
</body>
</html>