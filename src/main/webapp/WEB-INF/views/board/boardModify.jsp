<%--
  Created by IntelliJ IDEA.
  User: jsh1703
  Date: 2021-08-23
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/WEB-INF/views/include/head.jsp"/>
    <title>BoardWrite</title>
</head>
<body>
    <%-- include topNavbar.jsp --%>
    <jsp:include page="/WEB-INF/views/include/topNavbar.jsp"/>


<!-- middle container -->
<div class="container mt-4">
    <div class="row">

        <!-- Left Menu -->
        <div class="col-sm-3">

            <!-- Vertical Nav -->
            <ul class="nav flex-column nav-pills">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Active</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
            </ul>
            <!-- end of Vertical Nav -->
        </div>
        <!-- end of Left Menu  -->


        <!-- Right area -->
        <div class="col-sm-9">

            <!-- Contents area -->
            <div class="border border-info p-4 rounded">
                <h5>게시판 수정</h5>

                <hr class="featurette-divider">

                <form action="/board/modify" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="num" value="${ board.num }">
                    <div class="form-group">
                        <label for="mid">아이디</label>
                        <input type="text" class="form-control" id="mid" aria-describedby="idHelp" name="mid" value='${ sessionScope.id }' readonly>
                    </div>

                    <div class="form-group">
                        <label for="subject">제목</label>
                        <input type="text" class="form-control" id="subject" name="subject" value="${board.subject}" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea class="form-control" id="content" rows="10" name="content" >${board.content}</textarea>
                    </div>


                    <button type="button" class="btn btn-primary" id="btnAddFile">파일 추가</button>

                    <div><span>첨부 파일</span></div>
                    <%--기존 첨부파일 영역--%>
                    <div id="oldFileBox">
                        <c:forEach var="attach" items="${attachList}">
                            <input type="hidden" name="oldfile" value="${attach.uuid}">
                            <div>
                                <span>${ attach.filename }</span>
                                <button type="button" class="btn btn-primary btn-sm delete-oldfile">
                                    <i class="material-icons-outlined">삭제</i>
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                    <%--신규 첨부파일 영역--%>
                    <div id="newFileBox">

                    </div>


                    <div class="my-4 text-center">
                        <button type="submit" class="btn btn-primary">
                            <i class="material-icons align-middle">create</i>
                            <span class="align-middle">수정</span>
                        </button>
                        <button type="button" class="btn btn-primary ml-3" onclick="location.href = '/board/list?pageNum=${ pageNum }';">
                            <i class="material-icons align-middle">list</i>
                            <span class="align-middle">글목록</span>
                        </button>
                    </div>
                </form>
            </div>
            <!-- end of Contents area -->
        </div>
        <!-- end of Right area -->
    </div>
</div>
<!-- end of middle container -->



    <%--    include bottomFooter.jsp--%>
    <jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>

    <%--    include javascript.js--%>
    <jsp:include page="/WEB-INF/views/include/javascripts.jsp"/>
    <script>
        const MAX_FILE_COUNT = 5;
        let fileCount = ${ fn:length(attachList) };

        document.querySelectorAll('.delete-oldfile').forEach(
            (e) => {
                e.addEventListener('click',
                    () => {
                        e.parentElement.previousElementSibling.setAttribute('name', 'delfile');
                        e.parentElement.remove();
                        fileCount--;
                    })
            }
        )

        document.querySelector('#btnAddFile').addEventListener('click',
            () => {
                if(fileCount >= MAX_FILE_COUNT){
                    alert('첨부 파일은 최대 5개 까지만 가능합니다.')
                    return;
                }

                document.querySelector('#newFileBox').innerHTML += `
                    <div class="my-2">
                        <input type="file" class="form-control-file" id="exampleFormControlFile1" name="files">
                        <button type="button" class="btn btn-primary btn-sm delete-newfile">
                            <i class="material-icons-outlined">삭제</i>
                        </button>
                    </div>
                `;

                document.querySelectorAll('.delete-newfile').forEach(
                    (e) => {
                        e.addEventListener('click',
                            () => {
                                e.parentElement.remove();
                                fileCount--;
                            })
                    }
                )
                fileCount++;
            })
    </script>
</body>
</html>

