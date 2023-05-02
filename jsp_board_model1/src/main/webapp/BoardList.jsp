<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 4:09
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>

<%@ page import="java.util.List" %>

<%
    BoardDao dao = new BoardDao();
    // DB 연결
    dao.dbOpen();
    // 게시물 전체 리스트 가져오기
    List<BoardDto> boardList = dao.selectList();
    // DB 연결 해제
    dao.dbClose();
%>
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
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>글쓴이</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <%
            // 가져온 게시물 크기 확인
            if (boardList.size() != 0) {
            // 게시물이 있으면 반복문으로 출력
            for (BoardDto dto : boardList) {
        %>
        <tr>
            <td><%=dto.getPostNum()%></td>
            <%--  제목 표시 부분에 해당 글을 읽기 위한 링크를 설정  --%>
            <td><a href="BoardRead.jsp?postNum=<%=dto.getPostNum()%>" class="text-decoration-none"><%=dto.getPostTitle()%></a></td> <%--  링크 걸때언제 ./ 넣고 안넣는지 의문  --%>
            <td><%=dto.getPostWriteUser()%></td>
            <td><%=dto.getPostDate()%></td>
            <td><%=dto.getPostVisitCount()%></td>
        </tr>
        <%
            }
        }
            else {
        %>
<%--  게시물이 없으면  --%>
        <tr>
            <td colspan="5">게시물이 없습니다.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="d-flex justify-content-end">
        <a href="BoardWrite.jsp" class="btn btn-primary">글쓰기</a>
    </div>
</main>
<footer class="container-fluid my-5 border-top ">
    <p class="lead text-muted text-center">made by fullstack505</p>
</footer>
</body>
</html>
