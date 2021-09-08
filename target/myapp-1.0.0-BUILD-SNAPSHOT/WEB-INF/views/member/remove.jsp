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
    <jsp:include page="/WEB-INF/views/include/head.jsp"/>
    <title>Login</title>

</head>
<body class="text-center">


<form class="form-passwd" action="/member/remove" method="POST">
    <a href="/index.jsp" title="Home으로 가기">
        <i class="material-icons display-4">android</i>
    </a>

    <h4>비밀번호 입력</h4>
    <label for="passwd" class="sr-only">비밀번호</label>
    <input type="password" name="passwd" id="passwd" class="form-control" placeholder="비밀번호" required>
    <input type="password" name="passwd2" id="passwd2" class="form-control" placeholder="비밀번호" required>

    <p id="message">비밀번호를 입력하세요</p>
    <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="removeConfirm(event)">
        <i class="material-icons align-middle">login</i>
        <span class="align-middle">탈퇴</span>
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

    function removeConfirm(event){
        let con = confirm("정말로 탈퇴하시겠습니까?")
        if(!con){
            event.preventDefault();
        }
        return;
    }

    document.querySelector('#newPassword1').addEventListener('focusout', (e) => {
        test();
    });
    document.querySelector('#newPassword2').addEventListener('focusout', () => {
        test();
    });
</script>
</html>