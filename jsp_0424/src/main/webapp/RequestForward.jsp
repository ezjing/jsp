<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>request 영역</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h2>포워드로 전달된 페이지</h2>
    <h3>RequestForward.jsp 페이지</h3>
    <h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
    <%
      // forward로 인하여 이전 페이지의 request, response 내장 객체를 가져와서 사용함
      Person pPerson = (Person)(request.getAttribute("requestPerson"));
    %>
    <ul>
      <li>String 객체 : <%= request.getAttribute("requestString") %></li>
      <li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
    </ul>

    <h4>매개변수로 전달된 값 출력하기</h4>
    <%
      request.setCharacterEncoding("UTF-8");
      out.println(request.getParameter("paramHan"));
      out.println(request.getParameter("paramEng"));
    %>
  </div>
</body>
</html>
