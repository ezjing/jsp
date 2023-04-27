<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-27
    Time: 오후 12:31
    To change this template use File | Settings | File Templates.
--%>
<%--  문제 2) JDBConnect 클래스에 게시판의 글을 등록하는 postWrite, postList 메소드를 추가하고 ,해당 메소드를 사용하여 게시판의 글 목록을 확인하는 프로그램을 작성하세요  --%>
<%--  해당 클래스의 필드의 접근제한자를 모두 private으로 수정  --%>
<%--  postWrite, postList 메소드는 해당 실행 결과만 받아와서 화면에 출력  --%>
<%--  글 등록 페이지, 리스트 확인 페이지  --%>
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
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>글내용</th>
            <th>글쓴이</th>
            <th>등록날짜</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
<%--        list()--%>
            <tr>
<%--                <td><%=postNum%></td>--%>
<%--                <td><%=postTitle%></td>--%>
<%--                <td><%=postContent%></td>--%>
<%--                <td><%=postId%></td>--%>
<%--                <td><%=postDate%></td>--%>
<%--                <td><%=postVisitCount%></td>--%>
            </tr>
        </tbody>
    </table>
</body>
</html>
