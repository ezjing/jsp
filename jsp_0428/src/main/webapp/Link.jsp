<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오전 10:46
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table border="1" width="90%">
    <tr>
        <td align="center">
            <% if (session.getAttribute("UserId") == null) { %>
            <a href="./LoginForm.jsp">로그인</a>
            <% } else { %>
            <a href="./Logout.jsp">로그아웃</a>
            <% } %>
            &nbsp;&nbsp;&nbsp;
            <a href="./List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp;
            <a href="./List.jsp">게시판(페이징O)</a>
        </td>
    </tr>

</table>
