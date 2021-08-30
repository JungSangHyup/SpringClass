<%--
  Created by IntelliJ IDEA.
  User: jsh1703
  Date: 2021-08-23
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/include/head.jsp"/>
    <title>BoardWrite</title>
</head>
<body>
<%-- include topNavbar.jsp --%>
<jsp:include page="/include/topNavbar.jsp"/>


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
                <h5>게시판 새글쓰기</h5>

                <hr class="featurette-divider">

                <form action="" method="POST">
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" aria-describedby="idHelp" name="id" value="user1" readonly>
                    </div>

                    <div class="form-group">
                        <label for="subject">제목</label>
                        <input type="text" class="form-control" id="subject" name="subject" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea class="form-control" id="content" rows="10" name="content"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlFile1">첨부 파일</label>
                        <input type="file" class="form-control-file" id="exampleFormControlFile1">
                    </div>

                    <div class="my-4 text-center">
                        <button type="submit" class="btn btn-primary">
                            <i class="material-icons align-middle">create</i>
                            <span class="align-middle">새글등록</span>
                        </button>
                        <button type="reset" class="btn btn-primary ml-3">
                            <i class="material-icons align-middle">clear</i>
                            <span class="align-middle">초기화</span>
                        </button>
                        <button type="button" class="btn btn-primary ml-3" onclick="location.href = '/board/boardList.jsp';">
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
<jsp:include page="/include/bottomFooter.jsp"/>

<%--    include javascript.js--%>
<jsp:include page="/include/javascript.jsp"/>

</body>
</html>

