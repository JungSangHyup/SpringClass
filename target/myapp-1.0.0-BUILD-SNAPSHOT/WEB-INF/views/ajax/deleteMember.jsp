<%--
  Created by IntelliJ IDEA.
  User: jsh1703
  Date: 2021-09-07
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>회원정보 한개 삭제하기</h1>
<hr>

<input type="text" placeholder="삭제할 아이디 입력" id="id">
<button type="button" id="btn">회원삭제</button>
<p id="message"></p>

<ul></ul>
<script>
    document.querySelector('button#btn').addEventListener('click', () => {
        let id = document.querySelector('#id').value;
        console.log(id);

        fetch('/api/members/' + id, {
            method: 'DELETE',
        })
        .then((response) => {
            console.log(response);
            return response.json();
        })
        .then((data) => {
            console.log(data);  // success
            document.querySelector('p#message').innerHTML = id + " 회원정보 삭제 성공!";

        })
        .catch((err) => {
            console.log(err);
            document.querySelector('p#message').innerHTML = id + " 회원정보 삭제 실패";
        })
    })






</script>
</body>
</html>










