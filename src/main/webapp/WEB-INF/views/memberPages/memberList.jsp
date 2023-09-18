<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-15
  Time: 오후 3:03
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
<h2 class="text-center">회원목록</h2>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <th>이메일</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>프로필 사진 유무</th>
            <th>삭제하기</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.memberEmail}</td>
                <td>${member.memberName}</td>
                <td>${member.memberMobile}</td>
                <td>
                    <c:if test="${member.memberProfileAttached == 0}">
                        사진없음
                    </c:if>
                    <c:if test="${member.memberProfileAttached == 1}">
                        사진있음
                    </c:if>
                </td>
                <td><button class="btn btn-danger" onclick="delete_fn(${member.id})">삭제</button></td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="/WEB-INF/views/components/footer.jsp"%>
</body>
<script>
    const delete_fn = (id) =>{
        location.href="/member/delete?id=" + id;
    }
</script>
</html>
