<%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:33
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
    <c:import url="/layout/header.jsp"></c:import>
</header>
<main>
<div class="container-md my-5">
    <h3 class="text-center">방명록을 작성해 주세요!</h3>

    <div class="row">
        <div class="col-10">
            <div class="mb-5">
                <div class="d-grid justify-content-end mt-3">
                    <a href="/tasty/VisitlogWrite.do" class="btn btn-primary">방명록 쓰기</a>
                </div>
                <c:choose>
                    <c:when test="${empty visitlogList}"><h3>등록된 방명록이 없습니다.</h3></c:when>
                    <c:otherwise>
                        <c:forEach var="visitlog" items="${visitlogList}" varStatus="loop">
                                <table class="table my-3">
                                    <colgroup>
                                        <col style="width: 10%;">
                                        <col style="width: 10%;">
                                        <col style="width: 55%;">
                                        <col style="width: 10%;">
                                        <col style="width: 15%;">
                                    </colgroup>
                                    <tr class="border-white" style=" background-color: #e3f2fd;">
                                        <th class="text-center align-middle">${visitlog.visitlogNum}</th>
                                        <th class="text-center align-middle">${visitlog.nick}</th>
                                        <th class="text-center align-middle"></th>
                                        <th class="text-center align-middle"><small>${visitlog.date}</small></th>
                                        <th class="text-center align-middle"><a href="" class="text-decoration-none text-black">수정</a><a href="" class="text-decoration-none text-black ms-3">삭제</a></th>
                                    </tr>
                                </table>
                                <div class="row px-3">
                                    <div class="col-2 p-2 d-flex" style="height: 10em">
                                        <img src="/view/avatar2.png" class="rounded mx-auto d-block align-self-center" alt="" style="height: 80%">
                                    </div>
                                    <div class="col-10 mb-3" style="height: 10em">
                                        <textarea class="form-control" name="" id="" style="height: 100%;" readonly>${visitlog.content}</textarea>
                                    </div>
                                </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

<%--            <div class="mb-5">--%>
<%--                <table class="table">--%>
<%--                    <colgroup>--%>
<%--                        <col style="width: 10%;">--%>
<%--                        <col style="width: 10%;">--%>
<%--                        <col style="width: 50%;">--%>
<%--                        <col style="width: 10%;">--%>
<%--                        <col style="width: 10%;">--%>
<%--                        <col style="width: 10%;">--%>
<%--                    </colgroup>--%>
<%--                    <tr class="border-white" style=" background-color: #e3f2fd;">    &lt;%&ndash;여긴 표현언어든 jstl이든 바로 출력하게할것&ndash;%&gt;--%>
<%--                        <th class="text-center">no.1</th>--%>
<%--                        <th class="text-center">이지원</th>--%>
<%--                        <th class="text-center"></th>--%>
<%--                        <th class="text-center">2023.05.24</th>--%>
<%--                        <th class="text-center">수정</th>--%>
<%--                        <th class="text-center">삭제</th>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--                <div class="row px-3">--%>
<%--                    <div class="col-2 p-2 d-flex" style="height: 10em">--%>
<%--                        <img src="/view/avatar2.png" class="rounded mx-auto d-block align-self-center" alt="" style="height: 80%">--%>
<%--                    </div>--%>
<%--                    <div class="col-10" style="height: 10em">--%>
<%--                        <textarea class="form-control" name="" id="" style="width: 100%; height: 100%;"></textarea>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <c:import url="/layout/navi.jsp"></c:import>
    </div>
</div>
</main>
<footer>
    <c:import url="/layout/footer.jsp"></c:import>
</footer>
</body>
</html>
