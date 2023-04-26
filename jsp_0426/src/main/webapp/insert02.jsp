<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-26
    Time: 오후 12:06
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PrepareStatement로 SQL문 작성하기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container my-4">
        <div class="row">
            <div class="col-sm-6 mx-auto">
                <form action="insert02_process.jsp" method="post">
                    <div class="my-3">
                        <label for="title" class="form-label">글 제목 : </label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="글 제목을 입력해주세요">
                    </div>
                    <div class="my-3">
                        <label for="user-id" class="form-label">사용자 ID : </label>
                        <input type="text" class="form-control" id="user-id" name="userId" placeholder="글쓴이의 ID를 입력해주세요">
                    </div>
                    <div class="my-3">
                        <label for="content" class="form-label">글 내용 : </label>
                        <textarea type="text" class="form-control" id="content" name="content" rows="5"></textarea>
                    </div>
                    <div class="my-3 d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary me-2">글 등록</button>
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
