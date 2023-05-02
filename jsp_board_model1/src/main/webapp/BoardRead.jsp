<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-02
    Time: 오전 11:06
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>

<%
    // BoardList에서 넘겨준 글 번호 가져오기
    int postNum = Integer.parseInt(request.getParameter("postNum"));    // 기본적으로 문자열로 받아오기 때문에 숫자열 타입으로 바꾸면 오류남

    // 데이터 베이스 연결을 위해 BoardDao 객체 생성
    BoardDao dao = new BoardDao();
    dao.dbOpen();
    // 현재 글의 조회수 업데이트
    dao.updateVisitCount(postNum);
    // 글 번호를 매개변수로 하여 게시글의 해당 글 내용을 가져오기(BoardDto 타입의 객체에 저장)
    BoardDto board = dao.selectBoard(postNum);
    dao.dbClose();
%>

<html>
<head>
    <title>model1 방식 게시판 만들기</title>

    <%--  스타일 순서 지켜주기  --%>
    <%--  CSS  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--  제이쿼리  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <%--  부트스트랩  --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <script>
        $(document).ready(function() {
            $("#btn-list").on("click", function() {
                history.back();
            });

            $("#btn-delete").on("click", function () {
                let confirmed = confirm("정말로 삭제하시겠습니까?");

                if (confirmed) {
                    // 단순 링크를 사용하여 DeleteProcess.jsp 로 이동하여 삭제
                    const postNum = $("#post-num").val();
                    let url = "DeleteProcess.jsp?postNum=" + postNum;
                    location.href = url;
                }
            });

            $("#btn-edit").on("click", function () {
                // id값이 post-num인 html 태그의 value 값을 가져오기
                const postNum = $("#post-num").val();
                // 이동하려고 하는 URL 만들기
                const url = "BoardUpdate.jsp?postNum=" + postNum;   // 문자열 마지막("로 닫히기 전에)에 띄어쓰기 하지 않도록 주의 오류난다
                // 자바스크립트의 페이지 이동 명령을 사용하여 페이지 이동
                location.href = url;
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
        <h1 class="text-center">Model1 방식 게시판 글 확인 페이지</h1>
    </div>
</header>
<main class="container my-4 p-0">
    <%--  readonly disalbed로 수정되면 안되는 부분들 넣어주기  --%>
    <div class="row my-3">
        <%--  글번호, 글제목  --%>
        <div class="col-sm-2">
            <label for="post-num" class="form-label">글번호 : </label>
            <input type="text" class="form-control" id="post-num" name="postNum" value="<%=board.getPostNum()%>" disabled>
        </div>
        <div class="col-sm">
            <label for="post-title" class="form-label">글제목 : </label>
            <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>">
        </div>
    </div>
    <%--  글쓴이, 등록시간, 조회수  --%>
    <div class="row my-3">
        <div class="col-sm">
            <label for="post-write-user" class="form-label">글쓴이 : </label>
            <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%=board.getPostWriteUser()%>" readonly>
        </div>
        <div class="col-sm">
            <label for="post-date" class="form-label">등록시간 : </label>
            <input type="text" class="form-control" id="post-date" name="postDate" value="<%=board.getPostDate()%>" readonly>
        </div>
        <div class="col-sm">
            <label for="post-visit-count" class="form-label">조회수 : </label>
            <input type="text" class="form-control" id="post-visit-count" name="postVisitCount" value="<%=board.getPostVisitCount()%>" readonly>
        </div>
    </div>
    <%--  글내용  --%>
    <div class="row my-3">
        <div class="col-sm">
            <label for="post-content" class="form-label">글내용 : </label>
            <textarea name="postContent" id="post-content" rows="5" class="form-control"><%=board.getPostContent()%></textarea> <%--textarea는 벨류가 없기때문에 시작태그, 끝내그 사이에 넣는다--%>
        </div>
    </div>
    <%--  버튼  --%>
    <%--  float  --%>
<%--    <div class="row">--%>
<%--        <div class="col-sm clearfix">   &lt;%&ndash;  삭제, 수정 버튼 입력순서 주의  &ndash;%&gt;--%>
<%--            <button type="button" class="btn btn-secondary float-start" id="btn-list">목록</button>--%>
<%--            <button type="button" class="btn btn-primary float-end ms-2" id="btn-edit">수정</button>--%>
<%--            <button type="button" class="btn btn-danger float-end" id="btn-delete">삭제</button>--%>
<%--        </div>--%>
<%--    </div>--%>
    <%--  flexbox  --%>
    <div class="row my-3">
        <div class="col-sm d-flex justify-content-start">
            <button type="button" class="btn btn-secondary float-start" id="btn-list">목록</button>
        </div>
        <div class="col-sm d-flex justify-content-end"> <%--  삭제, 수정 버튼 입력순서 주의  --%>
            <%--  1. form을 사용한 방식  --%>
            <%--  form을 사용 시 form 태그의 자식태그로 포함되어 있는 input 태그의 데이터만 서버로 전송  --%>
<%--            <form action="DeleteProcess.jsp" method="get">  &lt;%&ndash;  method get이든 post이든 상관없다  &ndash;%&gt;--%>
<%--                <input type="hidden" name="postNum" value="<%=board.getPostNum()%>">--%>
<%--                <button type="submit" class="btn btn-danger float-end">1번 방식 삭제</button>--%>
<%--            </form>--%>
            <%--  2. a태그를 사용한 방식  --%>
            <%--  a태그를 이용하여 직접 DeleteProcess.jsp로 접속하여 게시물 삭제  --%>
<%--            <a href="DeleteProcess.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-danger">2번 방식 삭제</a>--%>
            <%--  3. 자바스크립트를 사용하는 방식  --%>
            <button type="button" class="btn btn-danger float-end" id="btn-delete">3번 방식 삭제</button>
            <%--  1. a 태그를 사용하여 BoardUpdate.jsp 로 이동  --%>
<%--            <a href="BoardUpdate.jsp?postNum<%=board.getPostNum()%>" class="btn btn-primary ms-2">수정</a>--%>
            <%--  2. 자바스크립트를 사용하여 BoardUpdate.jsp 로 이동  --%>
            <button type="button" class="btn btn-primary float-end ms-2" id="btn-edit">수정</button>
        </div>
    </div>
</main>
<footer class="container-fluid my-5 border-top ">
    <p class="lead text-muted text-center">made by fullstack505</p>
</footer>
</body>
</html>
