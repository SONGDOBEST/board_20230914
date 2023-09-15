<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-15
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
<%@include file="/WEB-INF/views/components/header.jsp"%>
<%@include file="/WEB-INF/views/components/nav.jsp"%>
<div id="section">
    <form action="/member/save" method="post" enctype="multipart/form-data">
        <input type="text" name="memberEmail" placeholder="이메일을 입력하세요"> <br>
        <input type="text" name="memberPassword" placeholder="비밀번호를 입력하세요"> <br>
        <input type="text" name="memberName" placeholder="이름을 입력하세요"> <br>
        <input type="text" name="memberMobile" placeholder="핸드폰번호를 입력하세요"> <br>
        <input type="file" accept="image/*" name="memberFile" multiple> <br>
        <input type="submit" value="회원가입"> <br>
    </form>
</div>

<%@include file="/WEB-INF/views/components/footer.jsp"%>
</body>
</html>
