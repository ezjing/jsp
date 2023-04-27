<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_0427.JDBConnect2" %>

<%@ include file="setup.jsp"%>

<%
//  클라이언트에서 가져온 데이터
  request.setCharacterEncoding("UTF-8");
  String postTitle = request.getParameter("title");
  String postContent = request.getParameter("content");
  String postUser = request.getParameter("userId");

  JDBConnect2 db = new JDBConnect2(dbDriver, dbUrl, dbUserId, dbUserPw);

  db.open();
//  클라이언트에서 전송된 데이터를 데이터베이스 저장
  int result = db.postWrite(postTitle, postContent, postUser);
  db.close();

  if (result != 0) {
    response.sendRedirect("./postList.jsp");
  }
  else {
    String code = "<script>";
    code += "alert('오류가 있습니다.');";
    code += "history.back();";
    code += "</script>";

    out.print(code);
  }
%>






