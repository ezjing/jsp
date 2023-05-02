<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 2:26
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 요청받은 페이지인 ParamMain.jsp 에서 생성한 변수
    String pValue = "방랑시인";
%>
<html>
<head>
    <title>액션 태그 - param</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<%--  액션 태그 useBean으로 자바빈즈 생성, 생성한 자바빈즈의 데이터 영역을 request로 설정(scope로 page 영역으로 설정 하면 데이터가 넘어가지 않음)  --%>
<%--  액션 태그의 include와 forward로 다시 요청한 페이지에서도 자바 빈즈를 공유  --%>
    <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request" />
<%--  액션 태그 setProperty로 데이터 입력  --%>
    <jsp:setProperty name="person" property="name" value="김삿갓" />
    <jsp:setProperty name="person" property="age" value="56" />

<%--  액션 태그 forward로 ParamForward.jsp로 이동  --%>
<%--  이동 주소에 param1이라는 변수명으로 데이터(? 뒤의 내용)를 추가하여 이동  --%>
    <jsp:forward page="./ParamForward2.jsp?param1=김병연">
<%--  액션태그 param  --%>
        <jsp:param name="param2" value="경기도 양주"/>
        <jsp:param name="param3" value="<%=pValue%>"/>
    </jsp:forward>
</body>
</html>
