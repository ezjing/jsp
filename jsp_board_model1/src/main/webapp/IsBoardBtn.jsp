<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-03
    Time: 오후 12:19
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--  스타일 순서 지켜주기  --%>
<%--  CSS  --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%--  제이쿼리  --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<%--  부트스트랩  --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>


<%
    switch (request.getRequestURI()) {
        case "/BoardWrite.jsp" :
            if (session.getAttribute("userId") != null) {
                %>
<div class="my-3">
    <button type="submit" class="btn btn-primary">글 등록</button>
    <a href="BoardList.jsp" class="btn btn-danger">취소</a>
</div>
<%
            }
            break;

        case "/BoardRead.jsp" :
            if (session.getAttribute("userId") != null) {
%>
<div class="col-sm d-flex justify-content-end">
    <button type="button" class="btn btn-danger float-end" id="btn-delete">3번 방식 삭제</button>
    <button type="button" class="btn btn-primary float-end ms-2" id="btn-edit">수정</button>
</div>
<%
        }
            break;

        case "/BoardUpdate.jsp" :
            if (session.getAttribute("userId") != null) {
%>
<div class="row my-3">
    <div class="col-sm-6 mx-auto d-flex justify-content-end">
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="reset" class="btn btn-secondary ms-2" id="btn-cancel">취소</button>
    </div>
</div>
<%
        }
            break;


        default :
            if (session.getAttribute("userId") != null) {
%>
<div class="d-flex justify-content-end">
    <a href="BoardWrite.jsp" class="btn btn-primary">글쓰기</a>
</div>
<%
            }
            break;
    }
%>