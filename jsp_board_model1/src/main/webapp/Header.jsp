<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-03
    Time: 오전 9:15
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 내장객체에서 uri 받아오기
//    String uri = request.getRequestURI();   // /BoardList.jsp (도메인 부분 http://localhost:8080 을 제외하고 쿼리스트링 ?~~~&~~~ 도 제외)
//    String url = String.valueOf(request.getRequestURL());   // http://localhost:8080/BoardList.jsp
    String title = "";

//    out.println(uri + "<br>");
//    out.println(url + "<br>");

switch (request.getRequestURI()) {
    // 주소별 헤더 출력 내용
    case "/BoardWrite.jsp" :
        title = "Model 1 방식 게시판 글 등록 페이지";
        break;

    case "/BoardRead.jsp" :
        title = "Model 1 방식 게시판 글 확인 페이지";
        break;

    case "/BoardUpdate.jsp" :
        title = "Model 1 방식 게시판 글 수정 페이지";
        break;

    case "/Login.jsp" :
        title = "Model 1 방식 게시판 회원 로그인 페이지";
        break;

    default :
        title = "Model 1 방식 게시판 목록 페이지";
        break;
}
%>

<header class="mb-4">
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
        <ul class="navbar-nav me-auto">
            <li class="nav-link"><a href="BoardList.jsp" class="nav-link">Home</a></li>
        </ul>
        <form class="d-flex me-2 mb-0" action="LogoutProcess.jsp" method="post">
            <%@ include file="IsHeaderBtn.jsp" %>>
        </form>
    </nav>
    <div class="container my-4 py-5 bg-secondary bg-opacity-50">
        <h1 class="text-center"><%=title%></h1>
    </div>
</header>