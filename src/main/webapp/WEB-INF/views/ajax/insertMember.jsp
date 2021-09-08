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
    아이디: <input type="text" name="id"><br>
    비밀번호: <input type="password" name="passwd"><br>
    이름: <input type="text" name="name"><br>
    생년월일: <input type="date" name="birthday"><br>
    성별:
    <select name="gender">
        <option value="" disabled selected>성별을 선택하세요.</option>
        <option value="M">남자</option>
        <option value="F">여자</option>
        <option value="N">선택 안함</option>
    </select>
    <br>
    이메일: <input type="email" name="email"><br>
    이메일 수신여부:
    <label><input type="radio" name="recvEmail" value="Y" checked> 예</label>
    <label><input type="radio" name="recvEmail" value="N"> 아니오</label>
    <br>
    <button type="submit" id="btn">회원가입</button>
</form>
<script>
    document.querySelector('#frm').addEventListener('submit', (event) =>{
        event.preventDefault();
        let obj = {};
        let formdata = new FormData(document.querySelector('#frm'));
        formdata.forEach((value, key) => {
            obj[key] = value;
        })

        console.log(obj);
        fetch('/api/members.json', {
            method: 'POST',
            headers: {
                "content-Type": "application/json",
            },
            body: JSON.stringify(obj),
        })
        .then((response) => {
            return response.json();
        })
        .then((data) => {
            console.log(typeof data);  // object
            console.log(data);  // {}
            alert('회원가입 성공!');
        })
        .catch((err) => {
            console.log(err);
        })
    })
</script>
</body>
</html>










