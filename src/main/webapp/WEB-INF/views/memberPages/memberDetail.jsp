<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-18
  Time: 오후 12:59
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
<%@include file="/WEB-INF/views/components/header.jsp" %>
<%@include file="/WEB-INF/views/components/nav.jsp" %>
<div id="section" class="card col-6 p-3">
    <table class="table table-striped text-center">
        <tr>
            <td>image</td>
            <td>이메일</td>
            <td>이름</td>
            <td>핸드폰번호</td>
            <td>비밀번호</td>
        </tr>
        <tr>
            <c:choose>
                <c:when test="${member.memberProfileAttached == 1}">
                    <td>
                        <c:forEach items="${memberFileList}" var="memberFile">
                            <img src="${pageContext.request.contextPath}/upload/${memberFile.storeFileName}"
                                 alt="" width="100" height="100">
                        </c:forEach>
                    </td>
                </c:when>
                <c:otherwise>
                    <td>
                        이미지 없음
                    </td>
                </c:otherwise>
            </c:choose>
            <td>${member.memberEmail}</td>
            <td>${member.memberName}</td>
            <td>${member.memberMobile}</td>
            <td>${member.memberPassword}</td>
        </tr>
    </table>
</div>
<div class="text-end">
    <button class="btn btn-primary" onclick="update_fn(${member.id})">수정</button>
    <button class="btn btn-secondary" onclick="main_fn(${member.id})">홈으로</button>
</div>
<%@include file="/WEB-INF/views/components/footer.jsp" %>
</body>
<script>
    const main_fn = (id) => {
        return location.href = "/"
    }
    const update_fn = (id) => {
        return location.href = "/member/update?id="+id;
    }
</script>
</html>
