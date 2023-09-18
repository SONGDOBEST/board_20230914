<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-18
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="/resources/css/style.css">
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="/WEB-INF/views/components/header.jsp"%>
<%@include file="/WEB-INF/views/components/nav.jsp"%>

  <div class="align-content-sm-center align-content-center align-content-lg-center card col-4 p-3" id="login-box">
    <form action="/member/login" method="post">
      <h2 class="text-center">로그인</h2>
      <div class="text-center">
      <input type="text" name="memberEmail" placeholder="이메일을 입력하세요"> <br>
      <input type="password" name="memberPassword" placeholder="비밀번호를 입력하세요"> <br>
      </div>
      <div class="text-end">
      <input type="submit" value="로그인">
      </div>
    </form>
  </div>
<%@include file="/WEB-INF/views/components/footer.jsp"%>
</body>
</html>
