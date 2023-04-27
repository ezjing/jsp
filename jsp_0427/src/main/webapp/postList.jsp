<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.jsp_0427.JDBConnect2" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%@ include file="setup.jsp"%>

<%
//  게시판 글 목록을 가져와서 저장할 변수
  List<Map<String, String>> dataList = null;
//  데이터 베이스 사용 객체 생성
  JDBConnect2 db = new JDBConnect2(dbDriver, dbUrl, dbUserId, dbUserPw);
//  데이터 베이스 연결
  db.open();
  dataList = db.postList();
//  데이터 베이스 연결 해제
  db.close();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>문제 2</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <div class="row">
    <div class="col-sm-6 mx-auto">
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
          for (Map<String, String> data : dataList) {
            String postNum = data.get("postNum");
            String postTitle = data.get("postTitle");
            String postUser = data.get("postUser");
            String postDate = data.get("postDate");
            String postVisit = data.get("postVisit");
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
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>






