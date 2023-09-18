<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-18
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>

<%@include file="/WEB-INF/views/components/header.jsp"%>
<%@include file="/WEB-INF/views/components/nav.jsp"%>
<h2 class="text-center">메인페이지</h2>
<c:if test="${sessionScope.loginMember.memberName != null}">
    <h3 class="text-center">${sessionScope.loginMember.memberName}님 환영합니다 !</h3>
</c:if>
<%@include file="/WEB-INF/views/components/footer.jsp"%>
</body>
</html>
