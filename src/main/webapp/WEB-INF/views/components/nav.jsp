<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="nav">
  <ul class="menu">
    <li class="menu-item">
      <a href="/">홈으로</a>
    </li>
    <li class="menu-item">
      <a href="/member/save">회원가입</a>
    </li>
    <!--        <li class="menu-item">-->
    <!--            <a href="/login">로그인</a>-->
    <!--        </li>-->
    <li class="menu-item">
      <a href="/member/list">회원목록</a>   <!-- 나중에 메뉴 바꿀 예정-->
    </li>
    <li class="menu-item">
      <a href="/board">게시판</a>
    </li>
    <!-- 로그인 여부에 따라 로그인했으면 oo님 환영합니다. 로그아웃링크 보이고
         로그인 하지 않았으면 로그인 이 보이도록
    -->
    <li class="menu-item" id="login-area">

    </li>
  </ul>
</div>
<%--<script>--%>
<%--  const loginArea = document.getElementById("login-area");--%>
<%--  const loginEmail = '${sessionScope.loginEmail}';--%>
<%--  console.log(loginEmail.length);--%>
<%--  if (loginEmail.length != 0) {--%>
<%--    // 로그인 했음--%>
<%--    loginArea.innerHTML = "<a href='/mypage'>" + loginEmail + "님 환영합니다!</a>" +--%>
<%--            "<a href='/logout'>logout</a>";--%>
<%--  } else {--%>
<%--    // 로그인 안했음--%>
<%--    loginArea.innerHTML = "<a href='/login'>로그인</a>";--%>
<%--  }--%>
<%--</script>--%>