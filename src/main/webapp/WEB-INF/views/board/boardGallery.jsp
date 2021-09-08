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
                <h5>이미지 개수 : ${ imageCount }</h5>

                <hr class="featurette-divider">

                <c:if test="${ not empty sessionScope.id }">
                    <!-- 새글쓰기 버튼 -->
                    <button type="button" class="btn btn-primary btn-sm float-right my-3" onclick="location.href = '/board/write';">
                        <i class="material-icons align-middle">create</i>
                        <span class="align-middle">새글쓰기</span>
                    </button>
                </c:if>



                <div class="clearfix"></div>

                <!-- 글목록 테이블 -->

                <div class="container text-center mt-5">
                    <div class="row">
                <c:choose>
                    <c:when test="${ imageCount > 0 }"><%-- 첨부파일 있으면 --%>
                            <c:forEach var="attach" items="${ imageList }">
                                <c:if test="${ attach.filetype eq 'I' }">
                                    <c:set var="fileCallPath" value="${ attach.uploadpath }/s_${ attach.uuid }_${ attach.filename }" />
                                    <c:set var="originPath" value="${ attach.uploadpath }/${ attach.uuid }_${ attach.filename }" />
                                    <div class="col-lg-4">
                                        <a href="/display?fileName=${ originPath }">
                                            <img src="/display?fileName=${ fileCallPath }">
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                    </c:when>
                    <c:otherwise><%-- 첨부파일 없으면 --%>
                        <span>이미지 파일이 없습니다.</span>
                    </c:otherwise>
                </c:choose>
                    </div><!-- /.row -->
                </div>


                <!-- pagination area -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center my-4">

                        <%-- 이전 --%>
                        <li class="page-item ${ (pageMaker.prev) ? '' : 'disabled' }">
                            <a class="page-link" href="${ (pageMaker.prev) ? '/board/list?pageNum=' += (pageMaker.startPage - 1) += '&type' += pageMaker.cri.type += '&keyword' += pageMaker.cri.keyword: '' }?#board">이전</a>
                        </li>

                        <%-- 시작페이지 번호 ~ 끝페이지 번호 --%>
                        <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
                            <li class="page-item ${ (pageMaker.cri.pageNum eq i) ? 'active' : '' }">
                                <a class="page-link" href="/board/list?pageNum=${ i }&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}?#board">${ i }</a>
                            </li>
                        </c:forEach>

                        <%-- 다음 --%>
                        <li class="page-item ${ (pageMaker.next) ? '' : 'disabled' }">
                            <a class="page-link" href="${ (pageMaker.next) ? '/board/list?pageNum=' += (pageMaker.endPage + 1) += '&type' += pageMaker.cri.type += '&keyword' += pageMaker.cri.keyword: '' }?#board">다음</a>
                        </li>

                    </ul>
                </nav>
                <!-- end of pagination area -->

                <hr class="featurette-divider">


                <!-- Search area -->
                <form class="form-inline justify-content-center my-4" action="/board/list" method="get">

                    <div class="form-group mx-3">
                        <label for="searchType">검색 조건</label>
                        <select class="form-control mx-2" id="searchType" name="type">
                            <option value="T" ${(pageMaker.cri.type eq 'T') ? 'selected': ''}>제목</option>
                            <option value="C" ${(pageMaker.cri.type eq 'C') ? 'selected': ''}>내용</option>
                            <option value="W" ${(pageMaker.cri.type eq 'W') ? 'selected': ''}>작성자</option>
                        </select>
                    </div>

                    <label for="searchKeyword">검색어</label>
                    <input type="text" class="form-control mb-2 mr-sm-2 mx-2" id="searchKeyword" placeholder="검색어" name="keyword" value="${pageMaker.cri.keyword}">

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
<jsp:include page="/WEB-INF/views/include/javascripts.jsp" />

</body>
</html>