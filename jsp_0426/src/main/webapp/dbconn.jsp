<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-26
    Time: 오후 3:11
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String dbUserId = "full505";
    String dbUserPw = "full505";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
%>