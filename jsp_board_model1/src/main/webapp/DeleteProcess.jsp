<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-02
    Time: 오후 2:06
    To change this template use File | Settings | File Templates.
--%>
<%--  화면이 출력되는 페이지가 아니기 때문에 html 코드 모두 지워도 됨.  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %> <%--  삭제만 하는데에 dto 사실 필요 없음  --%>
<%--  세션 확인  --%>
<%@ include file="IsLoggedIn.jsp"%>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>

<%
    // 삭제할 글 번호를 가져옴
    int postNum = Integer.parseInt(request.getParameter("postNum"));
    // 데이터 베이스 연결
    BoardDao dao = new BoardDao();
    dao.dbOpen();
    // dao를 사용하여 현재 글의 게시물 삭제, 데이터 베이스 연결 해제
    int deleteResult = dao.deleteBoard(postNum);
    dao.dbClose();

    // 삭제 성공 시 BoardList.jsp 이동, 실패 시 오류 메시지 출력 후 이전 페이지로 이동
    if (deleteResult == 1) {
        // BoardList.jsp 페이지로 이동
        response.sendRedirect("BoardList.jsp");
    }
    else {
        String errMsg = "<script>";
        errMsg += "alert('게시물 삭제 시 오류가 발생했습니다.');";
        errMsg += "history.back();";
        errMsg += "</script>";

        out.println(errMsg);
    }

%>

