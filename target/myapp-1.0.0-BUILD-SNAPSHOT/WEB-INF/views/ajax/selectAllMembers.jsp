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

<h1>회원정보 전체 가져오기</h1>
<hr>

<button type="button" id="btn">버튼</button>

<ul></ul>
<table border="1">
    <thead>
        <tr >
            <th>아이디</th><th>이름</th><th>성별</th><th>이메일</th>
        </tr>
    </thead>
    <tbody>
        <tr id="tr">
        </tr>
    </tbody>
</table>

<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
    document.getElementById('btn').addEventListener('click', (e) => {
        // ajax 함수 호출 - 비동기 자바스크립트 통신
        fetch('/api/members.json')
            .then((response) => {
                return response.json();
            })
            .then((datas) => {

                datas.forEach((data) => {
                    let tr = document.createElement('tr');
                    tr.innerHTML += "<th>" + data.id + "</th>";
                    tr.innerHTML += "<th>" + data.name + "</th>";
                    tr.innerHTML += "<th>" + data.gender + "</th>";
                    tr.innerHTML += "<th>" + data.email + "</th>";
                    document.querySelector('tbody').appendChild(tr);
                })
                }
            )
            .catch((err) => {
                alert('code: ' + err.status + '\n message: ' + err.responseText + '\n error: ' + err);
            })
    })
</script>
</body>
</html>










