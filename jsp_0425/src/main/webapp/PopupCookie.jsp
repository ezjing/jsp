<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 클라이언트에서 전송한 데이터를 가져옴
    String chkVal = request.getParameter("inactiveToday");

    // 클라이언트에서 전송한 값이 1이면 실행
    if (chkVal != null && chkVal.equals("1")) {
        Cookie cookie = new Cookie("PopupClose", "off");
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(60*60*24); // 시간 설정
        response.addCookie(cookie); // 쿠키 저장(클라이언트의 내장 객체)
        out.println("쿠키 : 하루 동안 열지 않음");    // 클라이언트로 내용 전송
    }
%>
<html>
<head>
    <title>PopupCookie</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

</body>
</html>
