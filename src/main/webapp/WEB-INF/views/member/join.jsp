<%--
  Created by IntelliJ IDEA.
  User: jsh1703
  Date: 2021-08-23
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/WEB-INF/views/include/head.jsp"/>
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
                <h5>회원 가입</h5>

                <hr class="featurette-divider">

                <form action="" method="POST">
                    <div class="form-group">
                        <label for="id">
                            <i class="material-icons align-middle">account_box</i>
                            <span class="align-middle">아이디</span>
                        </label>
                        <input type="text" class="form-control" id="id" aria-describedby="idHelp" name="id" required autofocus>
                        <small id="idHelp" class="form-text text-muted">아이디는 필수 입력 요소입니다.</small>
                    </div>

                    <div class="form-group">
                        <label for="password">
                            <i class="material-icons align-middle">lock</i>
                            <span class="align-middle">비밀번호</span>
                        </label>
                        <input type="password" class="form-control" id="password" aria-describedby="pwdHelp" name="passwd" required>
                        <small id="pwdHelp" class="form-text text-muted">비밀번호는 필수 입력 요소입니다.</small>
                    </div>
                    <div class="form-group">
                        <label for="password2">
                            <i class="material-icons align-middle">check</i>
                            <span class="align-middle">비밀번호 재확인</span>
                        </label>
                        <input type="password" class="form-control" id="password2">
                    </div>

                    <div class="form-group">
                        <label for="name">
                            <i class="material-icons align-middle">person</i>
                            <span class="align-middle">이름</span>
                        </label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>

                    <div class="form-group">
                        <label for="birthday">
                            <i class="material-icons align-middle">event</i>
                            <span class="align-middle">생년월일</span>
                        </label>
                        <input type="date" class="form-control" id="birthday" name="birthday">
                    </div>

                    <div class="form-group">
                        <label for="gender">
                            <i class="material-icons align-middle">wc</i>
                            <span class="align-middle">성별 선택</span>
                        </label>
                        <select class="form-control" id="gender" name="gender">
                            <option value="" disabled selected>성별을 선택하세요.</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                            <option value="U">선택 안함</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="email">
                            <i class="material-icons align-middle">mail</i>
                            <span class="align-middle">이메일 주소</span>
                        </label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>

                    <div class="text-center">
                        <label class="mr-3">이벤트 등 알림 메일 수신동의 : </label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="recvEmail" id="recvEmailYes" value="Y" checked>
                            <label class="form-check-label" for="recvEmailYes">동의함</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="recvEmail" id="recvEmailNo" value="N">
                            <label class="form-check-label" for="recvEmailNo">동의 안함</label>
                        </div>
                    </div>

                    <div class="text-center">
                        <label class="mr-3">이벤트 등 알림 메일 수신동의 : </label>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline1" name="customRadioInline" class="custom-control-input" checked>
                            <label class="custom-control-label" for="customRadioInline1">동의함</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline2" name="customRadioInline" class="custom-control-input">
                            <label class="custom-control-label" for="customRadioInline2">동의 안함</label>
                        </div>
                    </div>

                    <div class="my-3 text-center">
                        <button type="submit" class="btn btn-primary">회원가입</button>
                        <button type="reset" class="btn btn-primary ml-3">초기화</button>
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
<jsp:include page="/WEB-INF/views/include/javascript.jsp"/>

</body>
</html>
