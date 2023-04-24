<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오전 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - application</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h2>web.xml에 설정한 내용 읽어오기</h2>
    초기화 매개변수1 : <%= application.getInitParameter("INIT_PARAM") %>
    초기화 매개변수2 : <%= application.getInitParameter("TEST1") %>

    <h2>서버의 물리적 경로 얻어오기</h2>
    application 내장 객체 : <%= application.getRealPath("./") %>

    <h2>선언부에서 application 내장 객체 사용하기</h2>
    <%!
      public String useImplicitObject() {
        return this.getServletContext().getRealPath("./");
      }
      public String useImplicitObject(ServletContext app) {
        return app.getRealPath("./");
      }
    %>
    <ul>
      <li>this 사용 : <%= useImplicitObject()%></li>
      <li>내장 객체를 인수로 전달 : <%= useImplicitObject(application) %></li>
    </ul>
  </div>
</body>
</html>
