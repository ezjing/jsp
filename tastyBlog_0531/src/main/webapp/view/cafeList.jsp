<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-24
    Time: 오후 9:53
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<header>
    <jsp:include page="/layout/header.jsp"></jsp:include>
</header>

<%--  인스타 컨셉  --%>
<main>
<div class="container-md my-5">
    <div class="row">
        <div class="col-10">
            <div class="row row-cols-1 row-cols-md-3">
                <c:choose>
                    <c:when test="${empty cafeList}">
                        <h3>등록된 게시물이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="cafe" items="${cafeList}" varStatus="loop">
                            <div class="col ps-0">
                                <div class="card mb-3">
                                    <img src="/view/cafe1.PNG" class="card-img-top" alt="">
                                    <div class="card-body p-2">
                                        <h5 class="card-title m-0 text-center"><a href="/tasty/CafeRead.do?num=${cafe.writeNum}" class="text-decoration-none">${cafe.title}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
<%--                    <div class="card mb-3">--%>
<%--                        <img src="./cafe1.PNG" class="card-img-top" alt="">--%>
<%--                        <div class="card-body p-2">--%>
<%--                            <h5 class="card-title m-0 text-center">구수리 370</h5>--%>
<%--                        </div>--%>
<%--                    </div>--%>
            <%--  페이징  --%>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center my-5">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <c:import url="/layout/navi.jsp"></c:import>
    </div>

</div>
</main>

<footer>
    <%@ include file="/layout/footer.jsp"%>
</footer>
</body>
</html>
