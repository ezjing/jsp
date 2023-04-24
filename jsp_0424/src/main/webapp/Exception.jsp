<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>내장 객체 - exception</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <%
      int status = response.getStatus();

      if (status == 404) {
        out.print("404 에러가 발생하였습니다.");
        out.print("<br/>파일 경로를 확인해주세요.");
      }
      else if (status == 405) {
        out.print("405 에러가 발생하였습니다.");
        out.print("<br/>요청 방식(method)을 확인해주세요.");
      }
      else if (status ==500) {
        out.print("500 에러가 발생하였습니다.");
        out.print("<br/>소스 코드에 오류가 없는지 확인해주세요.");
      }
    %>
  </div>
</body>
</html>
