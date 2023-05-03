<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-02
    Time: 오전 9:15
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>model1 방식 게시판 만들기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

<%--  세션 확인  --%>
<%@ include file="IsLoggedIn.jsp"%>
<%@ include file="Header.jsp" %>

<main class="container my-4 p-0">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="WriteProcess.jsp" name="writeFrm" method="post">  <%--  WriteProcss로 이동  --%> <%--  form get 방식은 주소 뒤에 ?로 쿼리스트링 달아서 직접적으로 주소 데이터 서버에 전송, post 방식은 파일 내부에 담아서 주소 데이터를 서버에 전송. 두방식 다 request로 가져와야함  --%>
                <div class="my-3">
                    <label for="post-title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="post-title" name="postTitle" placeholder="제목을 입력하세요">
                </div>
                <div class="my-3">
                    <label for="post-content" class="form-label">내용 : </label>
                    <textarea type="text" class="form-control" id="post-content" name="postContent" rows="5" placeholder="내용을 입력하세요"></textarea>
                </div>
                <%@ include file="IsBoardBtn.jsp"%>
            </form>

        </div>
    </div>
</main>

<%@ include file="Footer.jsp" %>

</body>
</html>
