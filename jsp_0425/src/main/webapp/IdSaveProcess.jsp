<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-25
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.bitc.jsp_0425.CookieManager" %>
<%@ page import="com.bitc.jsp_0425.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 클라이언트에서 user_id, user_pw, save_check 값을 가져옴
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String save_check = request.getParameter("save_check");

    // 사용자 정보와 클라이언트에서 전송된 정보가 같으면
    if ("must".equals(user_id) && "1234".equals(user_pw)) {
        // 클라이언트에서 전송된 정보 중 saveCheck 값이 "Y"이면
        if (save_check != null && save_check.equals("Y")) {
            // 쿠키 생성
            CookieManager.makeCookie(response, "loginId", user_id, 86400);
        }
        else {
            // 아니면 삭제
            CookieManager.deleteCookie(response, "loginId");
        }

        // alertLocation로 이전 페이지(IdSaveMain.jsp) 돌아가기
        JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
    }
    else {
        //alertBack로 이전 페이지(IdSaveMain.jsp) 돌아가기
        JSFunction.alertBack("로그인에 실패했습니다.", out);
    }
%>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

</body>
</html>
