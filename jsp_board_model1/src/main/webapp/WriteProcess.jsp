<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-02
    Time: 오전 9:31
    To change this template use File | Settings | File Templates.
--%>
<%--  화면이 출력되는 페이지가 아니기 때문에 html 코드 모두 지워도 됨.  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--  데이터 베이스 사용을 위해 DTO 클래스와 DAO 클래스를 가져옴  --%>
<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>
<%@ page import="java.io.PrintWriter" %>

<%--  글쓰기 페이지에서 사용자가 입력한 내용 가져오기  --%>
<%
    // request : 사용자 요청 response : 사용자 응답
    request.setCharacterEncoding("UTF-8");
    String postTitle = request.getParameter("postTitle");
    String postContent = request.getParameter("postContent");

    // 데이터 베이스에 '전송'하기 위한 DTO 클래스 타입의 객체에 저장
    BoardDto dto = new BoardDto();
    dto.setPostTitle(postTitle);
    dto.setPostContent(postContent);
    // 원래는 세션 정보에 저장된 userId를 불러와서 사용해야 함(일단은 없어서 하드코딩 해둔 것)
    dto.setPostWriteUser("testuser1");

    // 데이터 베이스 '이용'을 위해서 DAO 클래스 타입의 객체 생성 및 DB 연결
    BoardDao dao = new BoardDao();
    dao.dbOpen();
    // DAO 객체에서 제공하는 insert 메소드를 사용하여 데이터 베이스에 글 등록
    int insertResult = dao.insertBoard(dto);
    dao.dbClose();

    // 글 등록 성공 및 실패에 따라 화면 이동
    if (insertResult == 1) {    // insertResult 에 값이 있으면 sendRedirect 가 지정하는 페이지로 이동
        response.sendRedirect("BoardList.jsp");
    }
    else {  // 글 등록이 실패한 경우 java로 알람 출력
        String script = "<script>";
        script += "alert('글쓰기 중 오류가 발생했습니다.');";
        script += "</script>";

        out.println(script);
    }
%>
