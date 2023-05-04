<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오전 10:49
    To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bitc.jsp_0504.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>표현언어(EL) - 객체 매개변수</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h2>영역을 통해 전달된 객체 읽기</h2>
    <ul>
        <%--  forward 된 페이지에서 내장 객체 영역을 지정하지 않으면 request를 사용함(forward 안된거면 page영ㅇㄱ)  --%>
        <li>Person 객체 => 이름 : ${personObj.name}, 나이 : ${personObj.age}</li>
        <%--  getName()으로 직접 서버에서 가져온것  --%>
        <li>Person 객체 => 이름 : ${personObj.getName()}, 나이 : ${personObj.age}</li>
        <%--  내장 객체 영역을 지정하여 데이터를 가져옴  --%>
        <li>String 객체 => ${requestScope.stringObj}</li>
        <li>Integer 객체 => ${integerObj}</li>
    </ul>
    <h2>매개변수로 전달된 값 읽기</h2>
    <ul>
        <%--  표현언어를 통해서 바로 연산하기  --%>
        <li>${param.firstNum + param['secondNum']}</li>
        <li>${param.firstNum} + ${param["secondNum"]}</li>
    </ul>
</div>
</body>
</html>
