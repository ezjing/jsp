<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판 글쓰기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form method="post" action="./postInsert.jsp">
        <div class="my-3">
          <label for="title" class="form-label">제목 : </label>
          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
        </div>
        <div class="my-3">
          <label for="userId" class="form-label">ID : </label>
          <input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 ID를 입력하세요">
        </div>
        <div class="my-3">
          <label for="content" class="form-label">글 내용 : </label>
          <textarea type="text" class="form-control" id="content" name="content" rows="5"></textarea>
        </div>
        <div class="my-3 d-grid gap-3">
          <button type="submit" class="btn btn-primary">확인</button>
          <button type="reset" class="btn btn-secondary">취소</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>






