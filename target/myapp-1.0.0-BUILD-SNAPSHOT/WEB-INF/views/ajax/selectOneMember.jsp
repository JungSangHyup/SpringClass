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

<h1>회원정보 한개 가져오기</h1>
<hr>

<input type="text" placeholder="아이디 입력" id="id">
<button type="button" id="btn">버튼</button>

<ul></ul>

<script>
    document.querySelector('button#btn').addEventListener('click', () => {
        let id = document.querySelector('#id').value;
        console.log('id : ' + id);

        // ajax 함수 호출 - 비동기 자바스크립트 통신
        fetch('/api/members/' + id + '.json')
        .then((response) => {
            return response.json();
        })
        .then((data) => {
            let str = document.createElement('li');
            if(data){
                str.innerHTML += data["member"].id + " ";
                str.innerHTML += data["member"].name + " ";
                str.innerHTML += data["member"].gender + " ";
                str.innerHTML += data["member"].email + " ";
            } else {
                str = `
				<li>${id}에 해당하는 데이터가 없습니다.</li>
			    `;
            }
            document.querySelector("ul").appendChild(str);
        })
    })
</script>
</body>
</html>










