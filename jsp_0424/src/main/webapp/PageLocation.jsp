<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>page 영역</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <h2>이동 후 page 영역의 속성값 읽기</h2>
    <%
      // 페이지가 변경 되었으므로 기존에 가지고 있는 page 내장 객체는 현재 페이지의 page 내장 객체와 다른 객체임
      // page 내장 객체가 가지고 있던 데이터를 출력 시 내용이 없음
      Object pInteger = pageContext.getAttribute("pageInteger");  // 삼항연산자 (if문 써도 상관 없다)
      Object pString = pageContext.getAttribute("pageString");
      Object pPerson = pageContext.getAttribute("pagePerson");
    %>
    <ul>
      <li>Integer 객체 : <%= (pInteger == null) ? "값 없음" : pInteger %></li>
      <li>String 객체 : <%= (pString == null) ? "값 없음" : pString %></li>
      <li>Person 객체 : <%= (pPerson == null) ? "값 없음" : ((Person)pPerson).getName() %></li>
    </ul>
  </div>
</body>
</html>
