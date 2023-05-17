<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오전 10:33
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FrontController.jsp</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h3>한번의 매핑으로 여러가지 요청 처리하기</h3>
    <%--  el언어를 사용하여 내용이 없을 경우 표시 X 있을 경우만 표시 (el언어는 값이 없어도 오류 안남)  --%>
    <%--  <%=request.getAttribute("resultValue")%> 이게 원래 표현 법 오류날 가능성 있음  --%>
    ${resultValue}
    <ol>
        <li>URI : ${uri}</li>
        <li>요청명 : ${commandStr}</li>
    </ol>


    <ul>
        <%-- 원래는 각각 해당하는 서블릿 파일 있어야 한다  --%>
        <%--  a 태그를 사용한 페이지 이동은 get 방식  --%>
        <li><a href="/servlet/regist.one" class="btn btn-link">회원 가입</a></li>
        <li><a href="/servlet/login.one" class="btn btn-link">로그인</a></li>
        <li><a href="/servlet/freeboard.one" class="btn btn-link">자유게시판</a></li>
    </ul>

    <h4>여러가지의 요청을 여러개의 servlet으로 처리</h4>
    <ul>
        <li><a href="/servlet/regist.two" class="btn btn-link">회원 가입</a></li>
        <li><a href="/servlet/login.two" class="btn btn-link">로그인</a></li>
        <li><a href="/servlet/freeboard.two" class="btn btn-link">자유게시판</a></li>
    </ul>
</div>
</body>
</html>
