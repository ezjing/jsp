<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-11
    Time: 오후 2:05
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
    <form action="FileUpload02Process.jsp" method="post" enctype="multipart/form-data">
        <label for="name1">이름 1 : </label>
        <input type="text" id="name1" name="name1"> <br>
        <label for="title1">제목 1 : </label>
        <input type="text" id="title1" name="title1"> <br>
        <label for="file1">파일 1:</label>
        <input type="file" id="file1" name="file1"> <br><br>

        <label for="name2">이름 2 : </label>
        <input type="text" id="name2" name="name2"> <br>
        <label for="title2">제목 2 : </label>
        <input type="text" id="title2" name="title2"> <br>
        <label for="file2">파일 2:</label>
        <input type="file" id="file2" name="file2"> <br><br>

        <label for="name3">이름 3 : </label>
        <input type="text" id="name3" name="name3"> <br>
        <label for="title3">제목 3 : </label>
        <input type="text" id="title3" name="title3"> <br>
        <label for="file3">파일 3:</label>
        <input type="file" id="file3" name="file3"> <br><br>

        <button type="submit" class="btn btn-primary">파일 올리기</button>
    </form>
</div>
</body>
</html>
