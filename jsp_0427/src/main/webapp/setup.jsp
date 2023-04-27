<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String dbDriver = application.getInitParameter("MySQLDriver");
  String dbUrl = application.getInitParameter("dbUrl");
  String opt1 = application.getInitParameter("dbUrlOpt1");
  String opt2 = application.getInitParameter("dbUrlOpt2");
  String opt3 = application.getInitParameter("dbUrlOpt3");
  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");

  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;
%>
