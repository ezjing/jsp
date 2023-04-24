<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList " %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>session 영역</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h2>페이지 이동 후 session 영역의 속성 읽기</h2>
    <%--   브라우저 바꾸며 확인해보기   --%>
    <%
      ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists"); // session.getAttribute()는 Object 타입의 arraylist이다. 문자열로 사용하기 위해서 앞에 (ArrayList타입의 <String>문자열) 이렇게 써주는 것
      for (String str : lists)
        out.print(str + "<br/>");
    %>
  </div>
</body>
</html>
