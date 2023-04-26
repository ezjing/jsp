<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-26
    Time: 오후 3:13
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%--  데이터 베이스 접속 정보를 가지고 있는 jsp 파일을 include로 가져오기  --%>
<%@ include file="dbconn.jsp"%>

<%--  데이터 베이스 사용 부분을 스크립틀릿으로 구현함  --%>
<%
    Statement stmt = null;
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
                <td>아이디</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>등록날짜</td>
            </tr>
        </thead>
        <tbody>
            <%--  반복되는 UI 부분 및 반복되는 데이터 가져오기 부분을 스크립틀릿으로 화면 구현  --%>
            <%
                try {
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM member";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String userId = rs.getString("id");
                        String userPw = rs.getString("pass");
                        String userName = rs.getString("name");
                        String userRegidate = rs.getString("regidate");
            %>
            <%--  표현식으로 데이터를 화면에 출력  --%>
            <tr>
                <td><%=userId%></td>
                <td><%=userPw%></td>
                <td><%=userName%></td>
                <td><%=userRegidate%></td>
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
                        if (rs!= null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
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
