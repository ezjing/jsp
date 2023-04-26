<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-26
    Time: 오후 2:22
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>PrepareStatement 로 SQL 쿼리사용하기</title>

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
                    <th>글내용</th>
                    <th>글쓴이</th>
                    <th>등록날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>

        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
                String dbUserId = "full505";
                String dbUserPw = "full505";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);

                String sql = "SELECT num, title, content, id, postdate, visitcount FROM board";

                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int postNum = rs.getInt("num");
                    String postTitle = rs.getString("title");
                    String postContent = rs.getString("content");
                    String postId = rs.getString("id");
                    String postDate = rs.getString("postdate");
                    int postVisitCount = rs.getInt("visitcount");
        %>
        <%--  방법 3  --%>
        <tr>
            <td><%=postNum%></td>
            <td><%=postTitle%></td>
            <td><%=postContent%></td>
            <td><%=postId%></td>
            <td><%=postDate%></td>
            <td><%=postVisitCount%></td>
        </tr>
        <%


                    // 방법 2
//                    out.println("<tr>");
//                    out.println("<td>" + postNum + "</td>");
//                    out.println("<td>" + postTitle + "</td>");
//                    out.println("<td>" + postContent + "</td>");
//                    out.println("<td>" + postId + "</td>");
//                    out.println("<td>" + postDate + "</td>");
//                    out.println("<td>" + postVisitCount + "</td>");
//                    out.println("</tr>");

                    // 방법 1
//                    out.println("글 번호 : " + postNum + "<br>");
//                    out.println("글 제목 : " + postTitle + "<br>");
//                    out.println("글쓴이 : " + postId + "<br>");
//                    out.println("등록날짜 : " + postDate + "<br>");
//                    out.println("조회수 : " + postVisitCount + "<br>");
//                    out.println("<br>--------------------------------------------<br>");
                }
            }
            catch (SQLException e) {
                out.println("데이터 베이스 사용 중 오류가 발생헀습니다.<br>");
                out.println("SQLException : " + e.getMessage());
            }
            finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
                catch (Exception e) {

                }
            }
        %>
            </tbody>
        </table>
    </div>
</body>
</html>
