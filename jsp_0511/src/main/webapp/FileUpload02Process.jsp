<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %><%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-11
    Time: 오후 2:11
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"--%>
<%--            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"--%>
<%--            crossorigin="anonymous"></script>--%>
</head>
<body>
<div class="container">
    <%
        MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());  /* DefaultFileRenamePolicy() : 중복파일 자동 이름 변경 */

        String name1 = multi.getParameter("name1");
        String title1 = multi.getParameter("title1");

        String name2 = multi.getParameter("name2");
        String title2 = multi.getParameter("title2");

        String name3 = multi.getParameter("name3");
        String title3 = multi.getParameter("title3");

        Enumeration<String> files = multi.getFileNames();

        String file3 = files.nextElement();
        String fileName3 = multi.getFilesystemName(file3);

        String file2 = files.nextElement();
        String fileName2 = multi.getFilesystemName(file2);

        String file1 = files.nextElement();
        String fileName1 = multi.getFilesystemName(file1);
    %>

    <table border="1">
        <tr>
            <th>이름</th>
            <th>파일</th>
            <th>제목</th>
        </tr>
        <%
            out.print("<tr><td>" + name1 + "</td>");
            out.print("<td>" + title1 + "</td>");
            out.print("<td>" + fileName1 + "</td></tr>");

            out.print("<tr><td>" + name2 + "</td>");
            out.print("<td>" + title2 + "</td>");
            out.print("<td>" + fileName2 + "</td></tr>");

            out.print("<tr><td>" + name3 + "</td>");
            out.print("<td>" + title3 + "</td>");
            out.print("<td>" + fileName3 + "</td></tr>");
        %>
    </table>
</div>
</body>
</html>
