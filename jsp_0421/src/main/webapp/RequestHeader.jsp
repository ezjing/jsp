<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Enumeration" %>
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
  <h2>3. 요청 헤더 정보 출력하기</h2>
  <%
      Enumeration headers = request.getHeaderNames();
    while (headers.hasMoreElements()) {
      String headerName = (String)headers.nextElement();
      String headerValue = request.getHeader(headerName);
      out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br/>");
    }
  %>
  <p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</div>
</body>
</html>
