<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오후 3:06
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--  jstl core태그 가져오기  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<%--<header class="py-5 bg-secondary bg-opacity-10">--%>
<%--    <div  class="container">--%>
<%--        <h1 class="display-2 text-center">MVC2 방식 게시판</h1>--%>
<%--        <h2 class="text-center">게시물 목록 페이지</h2>--%>
<%--    </div>--%>
<%--</header>--%>

<%--  액션태그의 include 로 페이지 불러오기  --%>
<%--<jsp:include page="/layout/header.jsp"></jsp:include>--%>

<%--  jstl의 import 로 페이지 불러오기와 parameter 전달  --%>
<c:import url="/layout/header.jsp">
    <c:param name="pageName" value="listPage"></c:param>
</c:import>

<main class="container my-4 py-4">
    <div class="my-3">
        <table class="table table-hover table-striped text-center">
            <colgroup>
                <col style="width: 6%">
                <col style="width: 50%">
                <col style="width: 15%">
                <col style="width: 6%">
                <col style="width: 15%">
                <col style="width: 8%">
            </colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>첨부</th>
                </tr>
            </thead>
            <tbody>
            <%--  jstl 조건문  --%>
            <c:choose>
                <%--  test : 조건  --%>
                <c:when test="${empty boardList}">
                    <tr>
                        <td colspan="6">등록된 게시물이 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <%--  jstl 반복문(향상된 for문)  --%>
                    <c:forEach items="${boardList}" var="item" varStatus="loop">
                        <tr>
                            <%--  컬럼명으로 받아오기(내장객체에 저장되어 있기 때문에 가능)  --%>
                            <td>${item.postIdx}</td>
                            <td class="text-start">
                                <a href="/mvcBoard/View.do?idx=${item.postIdx}" class="text-decoration-none">${item.postTitle}</a>
                            </td>
                            <td>${item.postWriter}</td>
                            <%--  메소드로 받아오기  --%>
                            <td>${item.getPostVisits()}</td>
                            <td>${item.getPostDate()}</td>
                            <td>
                                <%--  db에 ofile이있으면 다운로드 버튼 활성화  --%>
                                <c:if test="${not empty item.postOfile}">
                                    <a href="/mvcBoard/Download.do?ofile=${item.postOfile}&sfile=${item.postSfile}&idx=${item.postIdx}" class="text-decoration-none">Download</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
    <div class="my-3">
        <%--  검색창 구현 시 사용할 부분  --%>
    </div>
    <div class="my-3 d-flex justify-content-end">
        <a href="/mvcBoard/Write.do" class="btn btn-primary">글쓰기</a>
    </div>
</main>

<%--  디렉티브 태그(지시어) 인클루드  --%>
<%@ include file="/layout/footer.jsp" %>
<%--<footer class="my-5 py-4 border-top">--%>
<%--    <p class="text-muted lead my-5 text-center"> made by fullstack505</p>--%>
<%--</footer>--%>
</body>
</html>
