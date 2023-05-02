<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 2:37
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>인클루드된 페이지에서 매개변수 확인</h2>
<%--  액션 태그 param을 통해서 전송된 매개변수 2개를 가져옴  --%>
<%= request.getParameter("loc1") %>에
<%= request.getParameter("loc2") %>이 있습니다.
</>