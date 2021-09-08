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

<h1>회원정보 추가하기</h1>
<hr>

<form id="frm">
    아 이 디 : <input name="id" type="text">
    비밀번호 : <input name="passwd" type="password">
    이   름  : <input name="name" type="text">
    생년월일  : <input name="birthday" type="date">
    성   별  :
    <select name="gender">
        <option value="" disabled selected>성별을 선택하세요</option>
        <option value="M">남자</option>
        <option value="F">여자</option>
        <option value="N">선택 안함</option>
    </select>
    이 메 일 : <input type="email" name="email">
    수신여부 :
    <label><input type="radio" name="recvEmail" value="Y" checked>예</label>
    <label><input type="radio" name="recvEmail" value="N" checked>아니오</label>
    <br>
    <button type="submit" id="btn">회원가입</button>
</form>

<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
    $('form#frm').on('click', function (e) {
        e.preventDefault();
        let id = $('#id').val();
        console.log('id : ' + id);

        // ajax 함수 호출 - 비동기 자바스크립트 통신
        $.ajax({
            url: '/api/members/' + obj.id,
            method: 'PUT',
            success: function (data) {
                console.log(typeof data);  // object
                console.log(data);  // {}

                showData(data);
            },
            error: function (request, status, error) {
                alert('code: ' + request.status + '\n message: ' + request.responseText + '\n error: ' + error);
            }
        });
    });


    function showData(obj) {

        let str = '';

        if (obj.count > 0) {
            let member = obj.member;

            str = `
				<li>아이디: \${member.id}</li>
				<li>이름: \${member.name}</li>
				<li>성별: \${member.gender}</li>
				<li>이메일: \${member.email}</li>
			`;
        } else { // obj.count == 0
            let id = $('#id').val();

            str = `
				<li>\${id}에 해당하는 데이터가 없습니다.</li>
			`;
        }

        $('ul').html(str);
    } // showData
</script>
</body>
</html>










