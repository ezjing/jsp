<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오전 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - out</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
  <%
    out.print("출력되지 않는 텍스트");
    out.clearBuffer();  // 버퍼에 저장된 내용 전부 날림
    out.print("<h2>out 내장 객체</h2>");

    out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");   // 버퍼 기본값 8byte
    out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");

    out.flush();
    out.print("flush 후 버퍼의 크기 : " + out.getRemaining() + "<br>");

    out.print(1);
    out.print(false);
    out.print('가');
  %>
</div>
</body>
</html>
