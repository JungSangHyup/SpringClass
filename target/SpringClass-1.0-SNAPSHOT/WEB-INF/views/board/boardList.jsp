<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%-- include head.jsp --%>
    <jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body>
<%-- include topNavbar.jsp --%>
<jsp:include page="/WEB-INF/views/include/topNavbar.jsp" />



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
                <h5>게시판 글목록</h5>

                <hr class="featurette-divider">

                <!-- 새글쓰기 버튼 -->
                <button type="button" class="btn btn-primary btn-sm float-right my-3" onclick="location.href = '/board/boardWrite.jsp';">
                    <i class="material-icons align-middle">create</i>
                    <span class="align-middle">새글쓰기</span>
                </button>

                <div class="clearfix"></div>

                <!-- 글목록 테이블 -->
                <table class="table table-hover" id="board">
                    <thead>
                    <tr>
                        <th scope="col" class="text-center">번호</th>
                        <th scope="col" class="text-center">제목</th>
                        <th scope="col" class="text-center">작성자</th>
                        <th scope="col" class="text-center">작성일</th>
                        <th scope="col" class="text-center">조회수</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:choose>
                        <c:when test="${ pageMaker.totalCount gt 0 }">

                            <c:forEach var="board" items="${ boardList }">
                                <tr>
                                    <td class="text-center">${ board.num }</td>
                                    <td>
                                        <a href="/board/boardContent.jsp">${ board.subject }</a>
                                    </td>
                                    <td class="text-center">${ board.mid }</td>
                                    <td class="text-center"><fmt:formatDate value="${ board.regDate }" pattern="yyyy.MM.dd" /></td>
                                    <td class="text-center">${ board.readcount }</td>
                                </tr>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="text-center">게시판 글이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>

                    </tbody>
                </table>


                <!-- pagination area -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center my-4">
                        <li class="page-item disabled"><a class="page-link" href="#board">이전</a></li>
                        <li class="page-item active"><a class="page-link" href="#board">1</a></li>
                        <li class="page-item"><a class="page-link" href="#board">2</a></li>
                        <li class="page-item"><a class="page-link" href="#board">3</a></li>
                        <li class="page-item"><a class="page-link" href="#board">4</a></li>
                        <li class="page-item"><a class="page-link" href="#board">5</a></li>
                        <li class="page-item"><a class="page-link" href="#board">다음</a></li>
                    </ul>
                </nav>
                <!-- end of pagination area -->

                <hr class="featurette-divider">


                <!-- Search area -->
                <form class="form-inline justify-content-center my-4">

                    <div class="form-group mx-3">
                        <label for="searchType">검색 조건</label>
                        <select class="form-control mx-2" id="searchType" name="type">
                            <option value="" disabled selected>--</option>
                            <option value="T">제목</option>
                            <option value="C">내용</option>
                            <option value="W">작성자</option>
                        </select>
                    </div>

                    <label for="searchKeyword">검색어</label>
                    <input type="text" class="form-control mb-2 mr-sm-2 mx-2" id="searchKeyword" placeholder="검색어" name="keyword">

                    <button type="submit" class="btn btn-primary mb-2">
                        <i class="material-icons align-middle">search</i>
                        <span class="align-middle">검색</span>
                    </button>
                </form>
                <!-- end of Search area -->
            </div>
            <!-- end of Contents area -->
        </div>
        <!-- end of Right area -->
    </div>
</div>
<!-- end of middle container -->



<%-- include bottomFooter.jsp --%>
<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />


<%-- include javascripts.jsp --%>
<jsp:include page="/WEB-INF/views/include/javascript.jsp" />

</body>
</html>