<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        span.delete-file {
            background-color: yellow;
            color: red;
            font-weight: bold;
            cursor: pointer;
            border: 1px solid black;
            border-radius: 5px;
            padding: 2px;
            margin-left: 10px;
            display: inline-block;
        }
    </style>
</head>
<body>

<h1>게시판 새 주글 등록</h1>
<hr>

<form id="frm" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <th>작성자 아이디</th>
            <td><input type="text" name="mid" id="mid"></td>
        </tr>
        <tr>
            <th>글제목</th>
            <td><input type="text" name="subject" id="subject"></td>
        </tr>
        <tr>
            <th>글내용</th>
            <td><textarea rows="13" cols="40" name="content" id="content"></textarea></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
                <button type="button" id="btnAddFile">첨부파일 추가</button>
                <div id="fileBox">
                </div>
                <div id="uploadResult">
                    <ul></ul>
                </div>
            </td>
        </tr>
    </table>
    <br>
    <button type="submit">글쓰기</button>
</form>


<script src="/resources/js/jquery-3.6.0.js"></script>
<script>

    let fileCount = 1; // 화면에 보이는 파일입력상자 개수

    document.querySelector('#btnAddFile').addEventListener('click', () => {
        if (fileCount >= 5) {
            alert('첨부파일은 최대 5개 까지만 첨부할 수 있습니다.');
            return;
        }

        let str = `
			<div>
				<input type="file" name="files">
				<span class="delete-file">X</span>
			</div>
		`;

        $('div#fileBox').append(str);

        fileCount++;
        document.querySelectorAll('span.delete-file').forEach(
            (e) => {
                e.addEventListener('click',
                    () => {
                        e.parentElement.remove();
                        fileCount--;
                    })
            }
        )
    })



    let $cloneObj = $('div#fileBox').clone();


    document.querySelector('form#frm').addEventListener('submit', (event) => {
        // 폼 태그의 기본동작 막기
        event.preventDefault();

        //this // event.target  // 이벤트 소스 : 이벤트가 발생한 대상 오브젝트를 의미

        let form = document.querySelector('form#frm')  // $('form#frm')[0]
        console.log(form);

        let formData = new FormData(form); // 폼 안의 내용을 FormData 오브젝트로 변환해줌. 텍스트정보는 쿼리스트링으로 관리됨
        console.log(formData);

        // ajax 함수 호출
        $.ajax({
            url: '/api/boards',
            //enctype: 'multipart/form-data',
            method: 'POST',
            data: formData,
            processData: false, // 파일전송시 false 설정 필수!
            contentType: false, // 파일전송시 false 설정 필수!
            success: function (data) {
                console.log(typeof data); // object
                console.log(data);

                showAttachFilename(data.attachList);
                /*
                {
                    num: 140,
                    mid: 'jjj',
                    ...
                    attachList: [{}, {}, {}],
                    ...
                }
                */

                form.reset();
                $('div#fileBox').html($cloneObj.html());
            },
            error: function (request, status, error) {
                alert('code: ' + request.status + '\n message: ' + request.responseText + '\n error: ' + error);
            }
        });
    })

    function showAttachFilename(attachList) {
        let str = '';

        for (let attach of attachList) {
            str += `
				<li>\${attach.filename}</li>
			`;
        } // for

        $('div#uploadResult > ul').html(str);
    } // showAttachFilename

</script>
</body>
</html>










