<%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:31
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

<main class="container-md my-5">
    <div class="row">
        <div class="col-10">
            <div class="row">
                <div class="col-8">
                    <div class="card me-2 p-2" style="width: 100%; height: 100%; background-color: #e3f2fd;">
                        <a href="/tasty/TourList.do" class="text-decoration-none text-black"><h3>여행 / 맛집</h3></a>
                    <div class="row">
                        <div class="col">
                            <c:forEach var="tour" items="${tourList}" varStatus="loop">
                                <a href="/tasty/TourRead.do?num=${tour.writeNum}" class="text-decoration-none text-black">
                                    <div class="card my-3">
                                        <img src="/view/munsu1.jpg" class="card-img-top" alt="">    <%--  절대 경로를 들고올때 webapp이 최상위 경로이기 떄문에 /로 인식함 webapp/ 는 잘못된 경로   --%>
                                        <div class="card-body">
                                            <h5 class="card-title">${tour.title}</h5>
                                            <p class="card-text">${tour.content}</p>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                        <div class="col">
                            <c:forEach var="tour" items="${tourList}" varStatus="loop">
                                <a href="/tasty/TourRead.do?num=${tour.writeNum}" class="text-decoration-none text-black">
                                    <div class="card my-3">
                                        <img src="/view/noodle.jpg" class="card-img-top" alt="">    <%--  절대 경로를 들고올때 webapp이 최상위 경로이기 떄문에 /로 인식함 webapp/ 는 잘못된 경로   --%>
                                        <div class="card-body">
                                            <h5 class="card-title">${tour.title}</h5>
                                            <p class="card-text">${tour.content}</p>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
<%--                            <div class="card my-3">--%>
<%--                                <img src="/view/noodle.jpg" class="card-img-top" alt="">--%>
<%--                                <div class="card-body">--%>
<%--                                    <h5 class="card-title">무라카데 칼국수</h5>--%>
<%--                                    <p class="card-text">부추전과 얼큰 칼국수에 막걸리 한잔 행복</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card ms-2 p-2" style="width: 100%; height: 100%; background-color: #e3f2fd;">
                        <a href="/tasty/CafeList.do" class="text-decoration-none text-black"><h3>카페</h3></a>
                    <div class="row">
                        <div class="col">
                            <c:forEach var="cafe" items="${cafeList}" varStatus="loop">
                                <a href="/tasty/CafeRead.do?num=${cafe.writeNum}" class="text-decoration-none text-black">
                                    <div class="card my-3">
                                        <img src="/view/cafe1.PNG" class="card-img-top" alt="">    <%--  절대 경로를 들고올때 webapp이 최상위 경로이기 떄문에 /로 인식함 webapp/ 는 잘못된 경로   --%>
                                        <div class="card-body">
                                            <h5 class="card-title">${cafe.title}</h5>
                                            <p class="card-text">${cafe.content}</p>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/layout/navi.jsp"></c:import>
    </div>

</main>

<footer>
    <%@ include file="/layout/footer.jsp"%>
</footer>
</body>
</html>