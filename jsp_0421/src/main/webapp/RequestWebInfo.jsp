<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - request</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
  <ul>
    <%
      request.setCharacterEncoding("UTF-8");
    %>
    <li>데이터 전송 방식 : <%= request.getMethod()%></li>
    <li>URL : <%=request.getRequestURL()%></li>
    <li>URL : <%=request.getRequestURI()%></li>
    <li>프로토콜 : <%= request.getProtocol()%></li>
    <li>서버명 : <%=request.getServerName()%></li>
    <li>서버 포트 : <%=request.getServerPort()%></li>
    <li>클라이언트 IP 주소 : <%=request.getRemoteAddr()%></li>
    <li>쿼리스트링 : <%=request.getQueryString()%></li>
    <li>전송된 값 1 : <%=request.getParameter("eng")%></li>
    <li>전송된 값 2 : <%=request.getParameter("han")%></li>
  </ul>
</div>
</body>
</html>
