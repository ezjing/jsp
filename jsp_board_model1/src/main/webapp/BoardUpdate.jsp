<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-02
    Time: 오후 3:02
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>

<%
    // 이전 페이지에서 전달한 현재 글 번호 가져오기
    int postNum = Integer.parseInt(request.getParameter("postNum"));

    // 데이터베이스 연결
    BoardDao dao = new BoardDao();
    dao.dbOpen();

    // 현재 글 내용 불러오기
    BoardDto board = dao.selectBoard(postNum);
    dao.dbClose();

%>
<html>
<head>
    <title>model1 방식 게시판 만들기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <script>
        $(document).ready(function() {
            $("#btn-cancel").on("click", function () {
                history.back();
            });
        });
    </script>
</head>
<body>
<header class="mb-4">
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark text-secondary mb-3">
        <ul class="my-0">
            <li class="nav-link"><a href="#" class="nav-link">메뉴 1</a></li>
        </ul>
    </nav>
    <div class="container my-4 py-5 bg-secondary bg-opacity-50">
        <h1 class="text-center">Model1 방식 게시판 수정 페이지</h1>
    </div>
</header>
<main class="container my-4 p-0">
    <form action="UpdateProcess.jsp">
        <%--  글번호  --%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-num" class="form-label">글번호 : </label>
                <input type="text" class="form-control" id="post-num" name="postNum" value="<%=board.getPostNum()%>" readonly>
            </div>
        </div>
        <%--  글제목  --%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-title" class="form-label">글제목 : </label>
                <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>">
            </div>
        </div>
        <%--  글쓴이  --%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-writer-user" class="form-label">글쓴이 : </label>
                <input type="text" class="form-control" id="post-writer-user" name="postWriteUser" value="<%=board.getPostWriteUser()%>" readonly>
            </div>
        </div>
        <%--  글내용  --%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto">
                <label for="post-content" class="form-label">글내용 : </label>
                <textarea class="form-control" name="postContent" id="post-content" rows="5" placeholder="내용을 입력해주세요"><%=board.getPostContent()%></textarea>
            </div>
        </div>
        <%--  버튼  --%>
        <div class="row my-3">
            <div class="col-sm-6 mx-auto d-flex justify-content-end">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="reset" class="btn btn-secondary ms-2" id="btn-cancel">취소</button>
            </div>
        </div>
    </form>
</main>
<footer class="container-fluid my-5 border-top ">
    <p class="lead text-muted text-center">made by fullstack505</p>

</footer>
</body>
</html>
