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

<input type="text" placeholder="아이디 입력" id="id">
<button type="button" id="btn">버튼</button>

<ul></ul>
<table border="1">
    <thead>
        <tr>
            <th>아이디</th><th>이름</th><th>성별</th><th>이메일</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="4">버튼을 클릭하세요.</td>
        </tr>
    </tbody>
</table>

<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
    document.getElementById('btn').addEventListener('click', (e) => {
        let id = e.target.value;
        console.log('id : ' + id);

        // ajax 함수 호출 - 비동기 자바스크립트 통신
        fetch('/api/members.json')
            .then((data) => {
                    console.log(typeof data);  // object
                    console.log(data);  // {}

                    showData(data);
                }
            )
            .catch((err) => {
                alert('code: ' + err.status + '\n message: ' + err.responseText + '\n error: ' + err);
            })
    })

    function showData(array) {
        let str = '';

        if (array != null && array.length > 0) {
            for(let member of array){
                str = `
                <tr>
                    <th>아이디: ${member.id}</th>
                    <th>이름: ${member.name}</th>
                    <th>성별: ${member.gender}</th>
                    <th>이메일: ${member.email}</th>
                </tr>
			`;
            }
        } else { // obj.count == 0
            str = `
                <tr>
                    <th>데이터가 없습니다.</th>
                </tr>

			`;
        }
    } // showData
</script>
</body>
</html>










