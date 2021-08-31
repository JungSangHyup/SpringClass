<%--
  Created by IntelliJ IDEA.
  User: jsh1703
  Date: 2021-08-23
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/WEB-INF/views/include/head.jsp"/>
    <title>BoardContent</title>
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
        <!-- end of Left Menu -->


        <!-- Right area -->
        <div class="col-sm-9">

            <!-- Contents area -->
            <div class="border border-info p-4 rounded">
                <h5>게시판 글 상세보기</h5>

                <hr class="featurette-divider">

                <!-- 글 상세보기 영역 -->
                <table class="table table-striped">
                    <tr>
                        <th scope="row" class="text-center">제목</th>
                        <td colspan="5">${ board.subject }</td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-center">작성자</th>
                        <td>${ board.mid }</td>
                        <th scope="row" class="text-center">작성일</th>
                        <td><fmt:formatDate value="${ board.regDate }" pattern="yyyy.MM.dd" /></td>
                        <th scope="row" class="text-center">조회수</th>
                        <td>${ board.readcount }</td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th scope="row" class="text-center">추천</th>--%>
<%--                        <td class="text-primary">264</td>--%>
<%--                        <th scope="row" class="text-center">비추천</th>--%>
<%--                        <td class="text-danger">7</td>--%>
<%--                        <th scope="row" class="text-center">댓글</th>--%>
<%--                        <td>70</td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th scope="row" class="text-center">내용</th>
                        <td colspan="5">
                            <pre>${ board.content }</pre>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="text-center">첨부파일</th>
                        <td colspan="5">
                            <ul>
                                <li>첨부파일1</li>
                                <li>첨부파일2</li>
                                <li>첨부파일3</li>
                                <li>첨부파일4</li>
                                <li>첨부파일5</li>
                            </ul>
                        </td>
                    </tr>
                </table>


                <div class="text-right mt-4">
<%--                    로그인--%>
                    <c:if test="${ not empty sessionScope.id }">
                    <%--로그인 아이디와 글작성자 아이디가 같을 때--%>
                        <c:if test="${ sessionScope.id eq board.mid }">
                            <button type="button" class="btn btn-info btn-sm">
                                <i class="material-icons align-middle">edit</i>
                                <span class="align-middle">글수정</span>
                            </button>
                            <button type="button" class="btn btn-info btn-sm ml-3">
                                <i class="material-icons align-middle">delete</i>
                                <span class="align-middle">글삭제</span>
                            </button>
                        </c:if>
                        <button type="button" class="btn btn-info btn-sm ml-3">
                            <i class="material-icons align-middle">reply</i>
                            <span class="align-middle">답글쓰기</span>
                        </button>
                    </c:if>
                    <button type="button" class="btn btn-info btn-sm ml-3" onclick="location.href = '/board/list?pageNum=${ pageNum }'">
                        <i class="material-icons align-middle">list</i>
                        <span class="align-middle">글목록</span>
                    </button>
                </div>



                <!-- Comment -->
                <div id="comment" class="border border-secondary mt-5 p-3">
                    <i class="material-icons">forum</i> 댓글

                    <hr class="featurette-divider">

                    <ul class="list-unstyled mt-4">
                        <li class="media mb-2">
                            <img src="${pageContext.request.contextPath}/resources/images/kirby1.jpg" width="50" height="50" class="mr-3 rounded-circle">
                            <div class="media-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>홍길동 (user1)</h6>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="text-right text-secondary">
                                            <time class="comment-date">2021-07-23 15:07:24</time>
                                            | <a href="#">삭제</a>
                                            | <a href="#">수정</a>
                                            | <a href="#">답글</a>
                                        </div>
                                    </div>
                                </div>
                                <p>All my girls vintage Chanel baby. So you can have your cake. Tonight, tonight, tonight, I'm walking on air. Slowly swallowing down my fear, yeah yeah. Growing fast into a bolt of lightning. So hot and heavy, 'Til dawn. That fairy tale ending with a knight in shining armor. Heavy is the head that wears the crown.</p>
                            </div>
                        </li>

                        <li class="media mb-2">
                            <img src="${pageContext.request.contextPath}/resources/images/kirby2.jpg" width="50" height="50" class="mr-3 rounded-circle">
                            <div class="media-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>성춘향 (user2)</h6>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="text-right text-secondary">
                                            <time class="comment-date">2021-07-23 15:07:24</time>
                                            | <a href="#">삭제</a>
                                            | <a href="#">수정</a>
                                            | <a href="#">답글</a>
                                        </div>
                                    </div>
                                </div>
                                <p>Maybe a reason why all the doors are closed. Cause once you’re mine, once you’re mine. Be your teenage dream tonight. Heavy is the head that wears the crown. It's not even a holiday, nothing to celebrate. A perfect storm, perfect storm.</p>
                            </div>
                        </li>

                        <li class="media mb-2" style="margin-left: 40px;">
                            <i class="material-icons">subdirectory_arrow_right</i>
                            <img src="${pageContext.request.contextPath}/resources/images/kirby4.jpg" width="50" height="50" class="mr-3 rounded-circle">
                            <div class="media-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h6>이몽룡 (user3)</h6>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="text-right text-secondary">
                                            <time class="comment-date">2021-07-23 15:07:24</time>
                                            | <a href="#">삭제</a>
                                            | <a href="#">수정</a>
                                            | <a href="#">답글</a>
                                        </div>
                                    </div>
                                </div>
                                <p>Are you brave enough to let me see your peacock? There’s no going back. This is the last time you say, after the last line you break. At the eh-end of it all.</p>
                            </div>
                        </li>

                        <!-- modify comment -->
                        <li class="media mb-2" style="margin-left: 40px;">
                            <i class="material-icons">subdirectory_arrow_right</i>
                            <div class="media-body">
                                <form action="" method="post">
                                    <div class="row">
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label>댓글 수정</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-2 align-self-center">
                                            <button type="submit" class="btn btn-info btn-sm">수정</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <!-- end of modify comment -->

                        <!-- write reply comment -->
                        <li class="media mb-2" style="margin-left: 80px;">
                            <i class="material-icons">subdirectory_arrow_right</i>
                            <div class="media-body">
                                <form action="" method="post">
                                    <div class="row">
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label>답댓글 작성</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-2 align-self-center">
                                            <button type="submit" class="btn btn-info btn-sm">작성</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <!-- end of write reply comment -->
                    </ul>


                    <hr class="featurette-divider">


                    <!-- write new comment -->
                    <form action="" method="post">
                        <div class="row my-4">
                            <div class="col-10">
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">새댓글 작성</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="col-2 align-self-center">
                                <button type="submit" class="btn btn-info btn-sm">작성</button>
                            </div>
                        </div>
                    </form>
                    <!-- end of write new comment -->
                </div>
                <!-- end of Comment -->


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

</body>
</html>