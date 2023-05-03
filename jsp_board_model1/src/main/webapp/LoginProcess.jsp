<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-03
    Time: 오전 9:43
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--  데이터 베이스 사용을 위한 DTO, DAO 클래스 import  --%>
<%@ page import="com.bitc.jsp_board_model1.MemberDao" %>
<%@ page import="com.bitc.jsp_board_model1.MemberDto" %>

<%--  클라이언트에서 전달한 데이터 가져오기  --%>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId"); // Login.jsp 페이지의 form으로 받아온 정보
    String userPw = request.getParameter("userPw");

    // 데이터 베이스 연결
    MemberDao dao = new MemberDao();
    dao.dbOpen();

    // 클라이언트에서 전달한 정보가 데이터 베이스에 존재하는지 확인
    int selectResult = dao.isMember(userId, userPw);

    // 조회 결과가 1이면 데이터 베이스에 해당 정보가 있음, 1이 아니면 오류가 발생
    if (selectResult == 1) {
        // 사용자 정보를 데이터베이스에서 가져옴
        MemberDto member = dao.selectMember(userId, userPw);
        // 세션에 데이터 저장
        session.setAttribute("userId", member.getUserId());
        session.setAttribute("userName", member.getUserName());
        session.setMaxInactiveInterval(60); // 60초
        // 첫화면으로 이동 (BoardList.jsp)
        response.sendRedirect("BoardList.jsp");
    }
    else {
        // 오류 메시지 출력, 이전화면으로 이동 (history.back())
        String errMsg = "<script>";
        errMsg += "alert('ID나 비밀번호가 다릅니다.');";  // alert 부분 세미콜론 꼭 넣기!
        errMsg += "history.back()";
        errMsg += "</script>";

        out.println(errMsg);
    }

%>

<%--  데이터 베이스 연결 및 사용자 정보 확인  --%>

<%--  클라이언트에서 전달한 정보가 데이터 베이스에 존재하는지 확인  --%>

<%--  세션에 데이터 저장  --%>

<%--  화면 이동  --%>