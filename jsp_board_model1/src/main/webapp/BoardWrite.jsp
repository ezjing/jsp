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
<header class="mb-4">
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark text-secondary mb-3">
        <ul class="my-0">
            <li class="nav-link"><a href="#" class="nav-link">메뉴 1</a></li>
        </ul>
    </nav>
    <div class="container my-4 py-5 bg-secondary bg-opacity-50">
        <h1 class="text-center">Model1 방식 게시판 목록</h1>
    </div>
</header>
<main class="container my-4 p-0">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="WriteProcess.jsp" name="writeFrm" method="post">  <%--  WriteProcss로 이동  --%>
                <div class="my-3">
                    <label for="post-title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="post-title" name="postTitle" placeholder="제목을 입력하세요">
                </div>
                <div class="my-3">
                    <label for="post-content" class="form-label">내용 : </label>
                    <textarea type="text" class="form-control" id="post-content" name="postContent" rows="5" placeholder="내용을 입력하세요"></textarea>
                </div>
                <div class="my-3">
                    <button type="submit" class="btn btn-primary">글 등록</button> <%--  submit 버튼을 누르면 WriteProcss로 이동  --%>
                    <a href="BoardList.jsp" class="btn btn-danger">취소</a>   <%--  a태그로 취소버튼 만들기  --%>
<%--                    <button type="reset" class="btn btn-secondary">취소</button>--%>
                </div>
            </form>

        </div>
    </div>
</main>
<footer class="container-fluid my-5 border-top ">
    <p class="lead text-muted text-center">made by fullstack505</p>

</footer>
</body>
</html>
