<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오전 10:07
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
    <h2>폼값 전송하기</h2>
    <form action="FormResult.jsp" name="frm" method="post">
        이름 : <input type="text" name="name" /><br />
        성별 : <input type="radio" name="gender" value="Man" />남자
                <input type="radio" name="gender" value="Woman" />여자<br />
        학력 :
        <select name="grade" id="">
            <option value="ele">초딩</option>
            <option value="mie">중딩</option>
            <option value="high">고딩</option>
            <option value="uni">대딩</option>
        </select><br />
        관심 사항 :
            <input type="checkbox" name="inter" value="pol" />정치
            <input type="checkbox" name="inter" value="eco" />경제
            <input type="checkbox" name="inter" value="ent" />연예
            <input type="checkbox" name="inter" value="spo" />운동<br />
        <input type="submit" value="전송하기" />
    </form>
</div>
</body>
</html>
