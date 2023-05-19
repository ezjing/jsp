<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오후 3:06
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:import url="/layout/header.jsp">
    <c:param name="pageName" value="editPage"></c:param>
</c:import>

<main class="container my-4 py-4">
    <div class="col-sm-4 mx-auto">
        <form action="/mvcBoard/Edit.do" method="post">
            <div class="my-3">
                <label for="post-idx" class="form-label">글번호 : </label>
                <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>
            </div>
            <div class="my-3">
                <label for="post-title" class="form-label">제목 : </label>
                <input type="text" class="form-control" id="post-title" name="postTitle" value="${board.postTitle}" placeholder="제목을 입력해주세요">
            </div>
            <div class="my-3">
                <label for="post-writer" class="form-label">작성자 : </label>
                <input type="text" class="form-control" id="post-writer" name="postWriter" value="${board.postWriter}" placeholder="사용자 ID를 입력해주세요">
            </div>
            <div class="my-3">
                <label for="post-pass" class="form-label">비밀번호 : </label>
                <input type="password" class="form-control" id="post-pass" name="postPass" value="${board.postPass}" placeholder="비밀번호를 입력해주세요">    <%--  DAO의 selectBoardDetail에 비밀번호가 빠져있어서 안들고 와짐  --%>
            </div>
            <div class="my-3">
                <label for="post-content" class="form-label">내용 : </label>
                <textarea class="form-control" name="postContent" id="post-content" rows="5">${board.postContent}</textarea>
            </div>
            <div class="my-3">
                <div class="row">
                    <div class="col-sm d-grid gap-3">
                        <button type="submit" class="btn btn-success">수정</button>
                    </div>
                    <div class="col-sm d-grid gap-3">
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<%@ include file="/layout/footer.jsp"%>
</body>
</html>
