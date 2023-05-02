<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-02
    Time: 오후 3:27
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>

<%
    // 이전 페이지에서 수정할 데이터 정보 가져오기
    request.setCharacterEncoding("UTF-8");
    int postNum = Integer.parseInt(request.getParameter("postNum"));
    String postTitle = request.getParameter("postTitle");
    String postWriteUser = request.getParameter("postWriteUser");
    String postContent = request.getParameter("postContent");
    // 데이터 베이스 연결
    BoardDao dao = new BoardDao();
    dao.dbOpen();

    // 가져온 데이터로 데이터 수정하기
    int updateResult = dao.updateBoard(postNum, postTitle, postContent);
    dao.dbClose();

    // 수정 완료 시 BoardList.jsp 로 이동, 아니면 이전 페이지로 이동
    if (updateResult == 1) {
        response.sendRedirect("BoardList.jsp"); // 첫화면으로 이동
//        response.sendRedirect("BoardRead.jsp?postNum=" + postNum);  // 수정된 화면으로 이동
    }
    else {
        String errMsg = "<script>";
        errMsg += "alert('게시물 수정 중 오류가 발생했습니다.');";
        errMsg += "history.back();";
        errMsg += "</script>";

        out.print(errMsg);
    }
%>