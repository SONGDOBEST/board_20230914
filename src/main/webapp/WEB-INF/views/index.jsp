<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메인페이지</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
<%@include file="components/header.jsp"%>
<%@include file="components/nav.jsp"%>

로그인 이메일 : ${sessionScope.loginEmail} <br>

<%@include file="components/footer.jsp"%>
</body>
</html>
