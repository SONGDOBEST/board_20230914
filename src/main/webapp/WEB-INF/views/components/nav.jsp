<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
  <ul class="menu">
    <li class="menu-item">
      <a href="/">홈으로</a>
    </li>
    <c:if test="${sessionScope.loginMember.memberEmail == null}">
      <li class="menu-item">
        <a href="/member/save">회원가입</a>
      </li>
    </c:if>
    <!--        <li class="menu-item">-->
    <!--            <a href="/login">로그인</a>-->
    <!--        </li>-->
      <c:if test="${sessionScope.loginMember.memberEmail == 'admin'}">
    <li class="menu-item">
        <a href="/member/list">회원목록</a>
    </li>
      </c:if><!-- 나중에 메뉴 바꿀 예정-->

    <!-- 로그인 여부에 따라 로그인했으면 oo님 환영합니다. 로그아웃링크 보이고
         로그인 하지 않았으면 로그인 이 보이도록
    -->
    <li class="menu-item" id="login-area">

    </li>
  </ul>
</div>
<script>
  const loginArea = document.getElementById("login-area");
  const loginName = '${sessionScope.loginMember.memberName}';
  const loginId = '${sessionScope.loginMember.id}'
  console.log(loginName.length);
  if (loginName.length != 0) {
    // 로그인 했음
    loginArea.innerHTML = "<button onclick='detail_fn(loginId)'>" + loginName + "님 환영합니다!</button>" +
            "<a href='/board'>게시판</a>" + "<a href='/member/logout'>logout</a>";
  } else {
    // 로그인 안했음
    loginArea.innerHTML = "<a href='/member/login'>로그인</a>";
  }

  detail_fn = (id) => {
    location.href="/member/detail?id=" + id;
  }
</script>