<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-25
    Time: 오전 10:52
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--  제이쿼리 CDN  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <script>
        $(document).ready(function() {
            $("#cafeModal").modal("show");
        });

        $(document).ready(function() {
            $("#btn-close").on("click", function () {
                history.back(); // 윈도우 없이도 됨
                // alert("w조아요");
            });
        });

        // 바깥 영역 클릭 시 닫기(안됨)bb
        // $(document).mouseup(function (e){
        //     let container = $("#cafeModal");
        //     if( container.has(e.target).length === 0){
        //         container.css('display','none');
        //     }
        // });

        // $(document).mouseup(function (e){
        //     window.history.back();
        // });

    </script>
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

    <%--  모달  --%>
    <div class="modal" id="cafeModal" style="width: 80%; left: 10%;">
        <div class="modal-dialog-centered">
            <div class="modal-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-6 p-0">
                            <img src="/view/cafe1.PNG" class="img-fluid rounded-start" alt="">  <%--이미지 src에 나중에 첨부한 파일 경로 올리면 출력 될듯--%>
                        </div>
                        <div class="col-6 p-0 d-flex align-items-end flex-column">
                            <div class="d-flex justify-content-end ms-auto">
                                <button type="button" id="btn-close" class="btn-close m-1" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body container-fluid">
                                <h5 class="">${cafeR.title}</h5>
                                <p class="">${cafeR.content}</p>
                            </div>
                            <div class="modal-footer container-fluid">
                                <p class="text-start me-auto"><small class="text-muted">${cafeR.date}</small></p>
                                <button type="submit" class="btn btn-primary">확인</button>
                                <button type="button" class="btn btn-secondary">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <%@ include file="/layout/footer.jsp"%>
</footer>
</body>
</html>
