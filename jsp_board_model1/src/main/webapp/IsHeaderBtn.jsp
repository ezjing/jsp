<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-03
    Time: 오후 12:11
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--  스타일 순서 지켜주기  --%>
<%--  CSS  --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%--  제이쿼리  --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<%--  부트스트랩  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

<%--로그인/아웃 버튼 출력--%>
<%
    if (session.getAttribute("userId") != null) {
%>
    <span class="navbar-text me-2"><%= session.getAttribute("userName").toString() %>님 반갑습니다.</span>
    <button type="submit" class="btn btn-success">로그아웃</button>
<%}
    else {
        %>
    <a href="Login.jsp" class="btn btn-primary">로그인</a>
<%
    }
%>


