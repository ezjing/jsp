<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<%@ page import="java.sql.SQLException" %>

<%
    String dbDriver = application.getInitParameter("MySQLDriver");
    String dbUrl = application.getInitParameter("dbUrl");
    String opt1 = application.getInitParameter("dbUrlOpt1");
    String opt2 = application.getInitParameter("dbUrlOpt2");
    String opt3 = application.getInitParameter("dbUrlOpt3");
    String dbUserId = application.getInitParameter("dbUserId");
    String dbUserPw = application.getInitParameter("dbUserPw");

    dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

    JDBConnect jdbc = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문제1</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>글쓴이</th>
            <th>등록날짜</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                jdbc.open();

                jdbc.stmt = jdbc.conn.createStatement();
                String sql = "SELECT num, title, id, postdate, visitcount FROM board ";
                jdbc.rs = jdbc.stmt.executeQuery(sql);

                while (jdbc.rs.next()) {
                    int postNum = jdbc.rs.getInt("num");
                    String postTitle = jdbc.rs.getString("title");
                    String postUser = jdbc.rs.getString("id");
                    String postDate = jdbc.rs.getString("postdate");
                    String postVisit = jdbc.rs.getString("visitcount");

        %>
        <tr>
            <td><%=postNum%></td>
            <td><%=postTitle%></td>
            <td><%=postUser%></td>
            <td><%=postDate%></td>
            <td><%=postVisit%></td>
        </tr>
        <%
                }
            }
            catch (SQLException e) {}
            finally {
                jdbc.close();
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>


<%-- 문제2) JDBConnect 클래스에 게시판의 글을 등록하는 postWrite, postList 메소드를 추가하고, 해당 메소드를 사용하여 게시판의 글 목록을 확인하는 프로그램을 작성하세요--%>
<%-- 해당 클래스의 필드의 접근제한자를 모두 private으로 수정--%>
<%-- postWrite, postList 메소드는 해당 실행 결과만 받아와서 화면에 출력--%>
<%-- 글 등록 페이지, 리스트 확인 페이지--%>









