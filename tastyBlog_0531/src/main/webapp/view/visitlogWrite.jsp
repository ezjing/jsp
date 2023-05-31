<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-26
    Time: 오후 5:13
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--  제이쿼리 CDN  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

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
    <jsp:include page="/layout/header.jsp"></jsp:include>
</header>
<div class="container-md my-5">
    <form action="/tasty/VisitlogWrite.do" method="post" enctype="multipart/form-data">
        <div class="row px-3">
            <div class="col-2 p-2 d-flex" style="height: 10em">
                <img src="/view/avatar2.png" class="rounded mx-auto d-block align-self-center" alt="" style="height: 80%">
            </div>
            <div class="col-10">
                <div class="d-flex mb-3" style="height: 10em">
                    <textarea class="form-control" name="content" id="content" style="width: 90%; height: 100%;" placeholder="내용 입력"></textarea>
                </div>

                <div class="d-flex mb-3">
<%--                    <input type="file" class="form-control" id="file" name="file" style="width: 30%;">--%>
                    <div class="d-grid d-flex justify-content-end" style="width: 60%;">
                        <button type="submit" class="btn btn-primary mx-2">작성 완료</button>
                        <button type="button" class="btn btn-secondary" id="btn-back">목록</button>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <%--  로그인한 유저 정보 세션으로 가져와야함  --%>
            <input type="text" name="name" value="${sessionScope.nick}">
            <input type="text" name="accountNum" value="${sessionScope.accountNum}">
        </div>
    </form>
</div>

<footer>
    <%@ include file="/layout/footer.jsp"%>
</footer>
</body>
</html>
