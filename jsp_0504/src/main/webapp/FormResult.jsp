<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오전 10:13
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>표현 언어(EL) - 폼값 처리</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

<div class="container my-4">
    <h3>EL로 폼값 받기</h3>
    <ul>
        <li>이름 : ${param.name}</li>
        <li>성별 : ${param.gender}</li>
        <li>학력 : ${param.grade}</li>
        <li>관심사항 : ${paramValues.inter[0]}
            ${paramValues.inter[1]}
            ${paramValues.inter[2]}
            ${paramValues.inter[3]}</li>
    </ul>
</div>
</body>
</html>
