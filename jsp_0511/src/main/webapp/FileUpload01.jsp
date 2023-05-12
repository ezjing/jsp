<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-11
    Time: 오전 11:38
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <form action="FileUpload01Process.jsp" method="post" enctype="multipart/form-data">
                <div class="my-3">
                    <label for="user-name" class="form-label">이름 : </label>
                    <input type="text" class="form-control" id="user-name" name="userName">
                </div>
                <div class="my-3">
                    <label for="title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="title" name="title">
                </div>
                <div class="my-3">
                    <label for="file" class="form-label">첨부파일 : </label>
                    <input type="file" class="form-control" id="file" name="file">
                </div>
                <div class="my-3 d-grid gap-3">
                    <button type="submit" class="btn btn-primary">전송</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
