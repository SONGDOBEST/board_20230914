<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-20
  Time: 오전 8:57
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
<%@include file="/WEB-INF/views/components/header.jsp" %>
<%@include file="/WEB-INF/views/components/nav.jsp" %>
<h2 class="text-center">게시판 페이지</h2>
<div class="container">
    <button class="btn btn-primary" onclick="write_fn(${sessionScope.loginMember.memberEmail})">게시글 작성하기</button>
    <button class="btn btn-primary" onclick="board_list_fn(${sessionScope.loginMember.memberEmail})">게시글 목록보기</button>
</div>
<%@include file="/WEB-INF/views/components/footer.jsp" %>
</body>
<script>
    const write_fn = (email) => {
        location.href = "/board/save?email="+email;
    }
    const board_list_fn = (email) => {
        location.href = "/board/list?email="+email;
    }
</script>
</html>
