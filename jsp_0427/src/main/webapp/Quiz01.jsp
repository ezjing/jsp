<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-27
    Time: 오전 10:34
    To change this template use File | Settings | File Templates.
--%>

<%--  문제 1) JDBConnect 클래스와 Statement 클래스 및 ResultSet을 사용하여 데이터 베이스 정보를 가져오는 프로그램을 작성하세요  --%>
<%--  board 테이블의 정보를 가져와서 table 태그로 출력 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<%@ page import="com.bitc.jsp_0427.JDBStatement" %>
<%@ page import="com.bitc.jsp_0427.JDBResultSet" %>


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
<%
    JDBConnect jdbc = new JDBConnect();    // db 연결
    JDBStatement jdbs = new JDBStatement();
    JDBResultSet jdbr = new JDBResultSet();
%>
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
        <tr>
            while (rs.next()) {
            int postNum = rs.getInt("num");
            String postTitle = rs.getString("title");
            String postContent = rs.getString("content");
            String postId = rs.getString("id");
            String postDate = rs.getString("postdate");
            int postVisitCount = rs.getInt("visitcount");
            }
            <td><%=postNum%></td>
            <td><%=postTitle%></td>
            <td><%=postContent%></td>
            <td><%=postId%></td>
            <td><%=postDate%></td>
            <td><%=postVisitCount%></td>
        </tr>
        </tbody>
    </table>

    <%
        try {
            jdbc.open();
            jdbs.sql();
            while (rs.next()) {
                int postNum = rs.getInt("num");
                String postTitle = rs.getString("title");
                String postContent = rs.getString("content");
                String postId = rs.getString("id");
                String postDate = rs.getString("postdate");
                int postVisitCount = rs.getInt("visitcount");
    %>
    <tr>
        <td><%=postNum%></td>
        <td><%=postTitle%></td>
        <td><%=postContent%></td>
        <td><%=postId%></td>
        <td><%=postDate%></td>
        <td><%=postVisitCount%></td>
    </tr>
    <%
        }
        catch (SQLException e) {




        }
        finally {
            try {
                jdbc.close();
            }
            catch (Exception e) {

            }
        }
    %>


</div>
</body>
</html>
