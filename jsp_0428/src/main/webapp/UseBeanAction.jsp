<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 2:04
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%
        request.setCharacterEncoding("UTF-8");
//        String name = request.getParameter("name");
//        String age = request.getParameter("age");
    %>
    <h3>액션 태그로 폼값 한 번에 받기</h3>
    <%--  액션 태그 useBean을 사용하여 자바빈즈 생성  --%>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" />
    <%--  property에 '*' 사용 시 해당 자바빈즈의 모든 속성을 가르킴  --%>
    <%--  클라이언트에서 전송된 데이터의 이름과 setProperty의 property의 이름이 같을 경우 getParameter없이 자바빈즈에 바로 저장할 수 있음  --%>
    <jsp:setProperty name="person" property="*" />
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name"/></li>
        <li>나이 : <jsp:getProperty name="person" property="age"/></li>
    </ul>
</div>
</body>
</html>
