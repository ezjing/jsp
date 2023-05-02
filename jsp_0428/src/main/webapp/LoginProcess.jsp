<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오전 10:08
    To change this template use File | Settings | File Templates.
--%>
<%--  데이터 베이스를 사용하기 때문에 DTO 클래스와 DAO 클래스를 모두 import  --%>
<%@ page import="com.bitc.jsp_0428.MemberDTO" %>
<%@ page import="com.bitc.jsp_0428.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 클라이언트에서 전달된 데이터 가져오기
    String userId = request.getParameter("user_id");
    String userPwd = request.getParameter("user_pw");

    // DB객체 생성
    MemberDAO dao = new MemberDAO();
    dao.dbOpen();

    // 데이터 베이스와 데이터를 주고 받을 DTO 클래스 타입의 객체 생성
    // DAO를 통해서 데이터 가져오기
    MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
    dao.dbClose();  // DB 연결 종료

    // 가져온 DTO 객체에 데이터가 있는지 확인
    if (memberDTO.getId() != null) {
        // 데이터가 있을 경우 세션에 데이터 추가
        session.setAttribute("UserId", memberDTO.getId());
        session.setAttribute("UserName", memberDTO.getName());
        response.sendRedirect("LoginForm.jsp"); // 샌드리다이랙트로 로그인폼으로 다시 넘어감(아이디 이름 있는경우), 가장 윗줄부터 다시 실행(데이터가 있는지,,부터로그인 화면까지)
    }
    else {
        // 데이터가 없을 경우 내장객체 request에 오류 메시지 추가
        request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
        request.getRequestDispatcher("./LoginForm.jsp").forward(request, response);
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
