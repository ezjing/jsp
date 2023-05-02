<%@ page import="com.mysql.cj.Session" %><%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오전 9:50
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Session</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="./Link.jsp" />
<div class="container my-4">
    <h2>로그인 페이지</h2>

    <span style="color: red; font-size: 1.2em;">
        <%--  jsp 표현식 사용  --%>
        <%--  내장객체 request에 저장된 정보 중 LoginErrMsg 라는 이름을 가지고 있는 것이 있는지 확인  --%>
        <%--  내장객체 request에 저장된 정보가 없으면 빈 문자열, 있으면 입력된 에러메시지 출력  --%>
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
        // 내장객체 session에 저장된 정보 중 UserId 라는 이름의 데이터가 있는지 확인
        if (session.getAttribute("UserId") == null) {   // UserId가 없면 아래 실행
    %>
    <%--  자바스크립트로 input 태그에 데이터가 있는지 없는지 확인  --%>
    <script>
        function validateForm(form) {
            if (!form.user_id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }
            if (form.user_pw.value == "") {
                alert("패스워드를 입력하세요.");
                return false;
            }
        }
    </script>
    <%--  사용자 입력 데이터를 LoginProcess.jsp로 전달, submit 버튼 클릭 시 자바스크립트로 데이터 검증 함수 실행  --%>
    <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="password" name="user_pw" /><br />
        <input type="submit" value="로그인하기" />
    </form>

    <%--  내장객체 session 에 UserId 라는 이름의 데이터가 존재 시  --%>
    <% } else { %>
    <%--  내장객체 session 에서 UserName 이라는 이름의 데이터를 출력  --%>
    <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
    <a href="Logout.jsp">[로그아웃]</a>
    <%
        }
    %>
</div>
</body>
</html>
