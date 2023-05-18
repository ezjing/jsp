<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오후 3:06
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
<jsp:include page="/layout/header.jsp"></jsp:include>


<main class="container my-4 py-4">
    <div class="my-3 row">
        <div class="col-sm-4 mx-auto">
            <%--  post형식으로 다시 Write.do서블릿 파일에 전송  --%>
            <form action="/mvcBoard/Write.do" method="post">
                <div class="my-3">
                    <label for="title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                </div>
                <div class="my-3">
                    <label for="writer" class="form-label">작성자 : </label>
                    <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 ID를 입력하세요">
                </div>
                <div class="my-3">
                    <label for="pass" class="form-label">비밀번호 : </label>
                    <input type="text" class="form-control" id="pass" name="pass" placeholder="글삭제 비밀번호를 입력하세요">
                </div>
                <div class="my-3">
                    <label for="contents" class="form-label">글내용</label>
                    <textarea class="form-control" name="contents" id="contents" rows="5"></textarea>
                </div>
                <div class="my-3">
                    <label for="file" class="form-label">첨부파일 : </label>
                    <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">
                </div>
                <div class="my-3">
                    <div class="row">
                        <div class="col-sm d-grid">
                            <button type="submit" class="btn btn-primary">글 등록</button>
                        </div>
                        <div class="col-sm d-grid">
                            <button type="reset" class="btn btn-secondary">취소</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="/layout/footer.jsp" %>
</body>
</html>
