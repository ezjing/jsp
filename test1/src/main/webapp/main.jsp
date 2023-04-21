<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
<%--        <header class="my-4">--%>
<%--            <h1 class="text-center">Header 영역입니다.</h1>--%>
<%--        </header>--%>

    <%@include file="header.jsp"%>
        <main class="my-4">
            <div class="row">
                <div class="col-sm-6 mx-auto">
                    <h1>include를 사용한 페이지</h1>
                    <p>여기는 main 영역입니다.</p>
                </div>
            </div>
        </main>

    <%@include file="footer.jsp"%>
<%--        <footer class="my-4 border-top p-5 bg-secondary">--%>
<%--            <p class="text-muted text-center">made by fullstack 505</p>--%>
<%--        </footer>--%>
    </div>
</body>
</html>
