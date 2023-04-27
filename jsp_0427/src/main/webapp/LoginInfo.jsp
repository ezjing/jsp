<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-27
    Time: 오후 4:01
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>세션 사용하기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%
        String userId = "";
        String userPw = "";

        // getAttribute()로 데이터를 가져왔는데 데이터가 null일 경우 지정한 이름으로 세션에 저장된 데이터가 없음
        if (session.getAttribute("userId") != null) {
            // 세션 저장된 데이터는 모두 Object 타입이므로 데이터 타입 변환이 필요함
            userId = (String)session.getAttribute("userId"); // 강제 형변환을 사용하는 방법
            userPw = session.getAttribute("userPw").toString(); // toString() 메소드를 사용하는 방법
        }
    %>

    <h2>세션 확인 페이지</h2>
    <p><%=userId%>님 반갑습니다.</p>
    <p>당신의 비밀번호는 <%=userPw%> 입니다.</p>

    <a href="./LoginForm.jsp" target="_self" class="btn btn-info">로그인 페이지로 되돌아가기</a>
</div>
</body>
</html>
