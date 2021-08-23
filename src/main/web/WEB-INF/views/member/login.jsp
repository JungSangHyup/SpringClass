<%--
  Created by IntelliJ IDEA.
  User: jsh1703
  Date: 2021-08-23
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/include/head.jsp"/>
    <title>Login</title>
</head>
<body class="text-center">


<form class="form-signin" action="" method="POST">
    <a href="/index.jsp" title="Home으로 가기">
        <i class="material-icons display-4">android</i>
    </a>
    <h1 class="h3 mb-3 font-weight-normal">회원 로그인</h1>

    <label for="inputId" class="sr-only">ID</label>
    <input type="text" name="id" id="inputId" class="form-control" placeholder="아이디" required autofocus>

    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" name="passwd" id="inputPassword" class="form-control" placeholder="비밀번호" required>

    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" name="rememberMe" value="remember-me"> 로그인 상태 유지
        </label>
    </div>

    <div class="custom-control custom-checkbox text-center mb-3">
        <input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberMe" value="remember-me">
        <label class="custom-control-label" for="customCheck1">로그인 상태 유지</label>
    </div>

    <div class="custom-control custom-switch text-center mb-3">
        <input type="checkbox" class="custom-control-input" id="customSwitch1" name="rememberMe" value="remember-me">
        <label class="custom-control-label" for="customSwitch1">로그인 상태 유지</label>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">
        <i class="material-icons align-middle">login</i>
        <span class="align-middle">로그인</span>
    </button>

    <hr class="featurette-divider">

    <div class="text-center text-secondary">
        <a href="#!">아이디 찾기</a>
        | <a href="#!">비밀번호 찾기</a>
        | <a href="/member/join.jsp">회원가입</a>
    </div>

    <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
</form>

<%--    include javascript.js--%>
<jsp:include page="/include/javascript.jsp"/>

</body>
</html>