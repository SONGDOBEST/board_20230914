<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-20
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <div id="section">
    <form action="/board/save" method="post">
      작성자: <input type="text" name="boardWriter" value="${sessionScope.loginMember.memberEmail}" readonly>
      비밀번호: <input type="password" name="boardPass" placeholder="비밀번호를 입력하세요!"> <br>
      제목: <input type="text" name="boardTitle" placeholder="제목을 입력하세요!"> <br>
      게시글 내용: <textarea type="text" name="boardContents" cols="30" rows="10"></textarea> <br>
      파일 첨부:<input type="file" name="boardFile"> <br>
      <input type="submit" value="게시글 등록">
    </form>
  </div>
</body>
</html>
