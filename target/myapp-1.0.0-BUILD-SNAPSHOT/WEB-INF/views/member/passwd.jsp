<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/WEB-INF/views/include/head.jsp"/>
    <title>Login</title>
</head>
<body class="text-center">

<form class="form-passwd" action="/member/passwd" method="POST">
    <a href="/index.jsp" title="Home으로 가기">
        <i class="material-icons display-4">android</i>
    </a>
    <h1 class="h3 mb-3 font-weight-normal">비밀번호 변경</h1>

    <label for="oldPassword" class="sr-only">현재 비밀번호</label>
    <input type="password" name="oldPasswd" id="oldPassword" class="form-control" placeholder="이전 비밀번호" required>

    <h4>새 비밀번호</h4>
    <label for="newPassword1" class="sr-only">새 비밀번호</label>
    <input type="password" name="newPasswd" id="newPassword1" class="form-control" placeholder="새 비밀번호" required>
    <input type="password" name="newPasswd2" id="newPassword2" class="form-control" placeholder="새 비밀번호" required>

    <p id="message">비밀번호를 입력하세요</p>
    <button class="btn btn-lg btn-primary btn-block" type="submit" >
        <i class="material-icons align-middle">login</i>
        <span class="align-middle">로그인</span>
    </button>

    <hr class="featurette-divider">

    <p class="mt-5 mb-3 text-muted">&copy; 2017-2021</p>
</form>
<%--    include javascript.js--%>
<jsp:include page="/WEB-INF/views/include/javascripts.jsp"/>
</body>
<script>
    function test(){
        let pass = document.querySelector('#newPassword1').value;
        let pass2 = document.querySelector('#newPassword2').value;
        if(pass != pass2) {
            document.querySelector('p#message').innerHTML = '비밀번호가 다릅니다.';
            return false;
        }else {
            document.querySelector('p#message').innerHTML = '비밀번호가 같습니다.';
            return true;
        }
    }

    document.querySelector('#newPassword1').addEventListener('focusout', (e) => {
        test();
    });
    document.querySelector('#newPassword2').addEventListener('focusout', () => {
        test();
    });
</script>
</html>