<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-18
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="section">
    <form action="/member/update" method="post" name="updateForm">
        <input type="hidden" name ="id" value="${member.id}" readonly>
        이메일: <input type="text" name ="memberEmail" value="${member.memberEmail}" readonly>
        비밀번호: <input type="text" name="memberPassword" value="${member.memberPassword}">
        이름: <input type="text" name="memberName" value="${member.memberName}" readonly>
        전화번호: <input type="text" name="memberMobile" value="${member.memberMobile}">
    <input type="submit" value="수정하기" onclick="update_fn(${member.id})">
    </form>
</div>

</body>
<script>
    const update_fn = (id) => {
        location.href="/member/update?id="+id;
    }
</script>
</html>
