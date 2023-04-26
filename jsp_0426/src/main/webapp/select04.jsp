<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-26
    Time: 오후 3:34
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--  문제 1) PreparedStatement 를 사용하는 SQL 쿼리문을 실행하고 그 결과를 출력하는 프로그램을 작성하세요  --%>
<%--  데이터 베이스 접속 정보가 있는 dbconn.jsp 를 include하여 사용 하는 방식으로 구현하세요  --%>
<%@ include file="dbconn.jsp"%>
<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
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
            <%
                try {
                    String sql = "SELECT * FROM board";
                    pstmt = conn.prepareStatement(sql); // include 해온 dbconn.jsp 의 변수
                    rs = pstmt.executeQuery();

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
                }
                catch (SQLException e) {
                    out.println("데이터 베이스 사용 중 오류가 발생했습니다.<br>");
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
