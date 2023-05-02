<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 12:44
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_0428.Person" %>
<html>
<head>
    <title>액션 태그 - UseBean</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h2>useBean 액션 태그</h2>
    <h3>자바빈즈 생성하기</h3>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request"></jsp:useBean>

    <h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
    <jsp:setProperty name="person" property="name" value="김경아" />
    <jsp:setProperty name="person" property="age" value="26" />

    <h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name"/></li>
        <li>나이 : <jsp:getProperty name="person" property="age"/></li>
    </ul>

    <br>
    <hr>
    <br>

    <h3>useBean 미사용 시</h3>
    <%
        Person person1 = new Person();
        person1.setName("이지원");
        person1.setAge(28);
    %>

    <ul>
        <li>이름 : <%=person1.getName()%></li>
        <li>나이 : <%=person1.getAge()%></li>
    </ul>




</div>
</body>
</html>

