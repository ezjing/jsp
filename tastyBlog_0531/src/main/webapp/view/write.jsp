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
    <%--  제이쿼리 CDN  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <script>
        $(document).ready(function () {
            $("#btn-back").on("click", function () {
                history.back();
            })
        });
    </script>
</head>
<body>
<header>
    <c:import url="/layout/header.jsp"></c:import>
</header>

<main>
<div class="container-md my-5">

    <form action="/tasty/Write.do" method="post" enctype="multipart/form-data">
        <div class="d-flex mb-3">    <%--  d-flex는 부모태그에 적용, 버튼 이미지 인풋 등에 사용 가능  --%>
            <label class="align-self-center form-label" for="title" style="width: 10%">제목 :</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="" style="width: 90%">

        </div>
        <div class="d-flex mb-3">
            <label class="mt-1 form-label" for="content" style="width: 10%">내용 :</label>
            <textarea class="form-control" id="content" name="content" cols="30" rows="10" style="width: 90%"></textarea>
        </div>
        <div class="d-flex mb-3">
            <label class="align-self-center form-label" for="file" style="width: 10%">첨부 파일 :</label>
            <input type="file" class="form-control" id="file" name="file" placeholder="" style="width: 30%;">
            <div class="d-grid d-flex justify-content-end" style="width: 60%;">
                <button type="submit" class="btn btn-primary mx-2">작성 완료</button>
                <button type="button" class="btn btn-secondary" id="btn-back">목록</button>
            </div>
        </div>
        <div>
            <%--  로그인한 유저 정보 세션으로 가져와야함  --%>
            <input type="hidden" name="name" value="${sessionScope.name}">
            <input type="hidden" name="accountNum" value="${sessionScope.accountNum}">
        </div>
    </form>
</div>
</main>

<footer>
    <c:import url="/layout/footer.jsp"></c:import>
</footer>
</body>
</html>
