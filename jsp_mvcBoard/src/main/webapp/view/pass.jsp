<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오후 3:06
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--  제이쿼리 CDN  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <%--  부트스트랩  --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <script>
        $(document).ready(function() {
            $("#frm").on("submit", function () {
                const pass = $("#post-pass").val();

                if (pass == "" || pass == null || pass == undefined) {
                    alert("비밀번호를 입력하세요");
                    $("#post-pass").focus();
                    return false;
                }
            });

            $("#btn-cancel").on("click", function () {
                history.back();
            });
        });
    </script>
</head>
<body>
<c:import url="/layout/header.jsp">
    <c:param name="pageName" value="confirmedPage"></c:param>
</c:import>

<main class="container my-4 py-4">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <form action="/mvcBoard/Pass.do" method="post" id="frm">
                <div class="my-3">
                    <label for="post-pass" class="form-label">비밀번호 : </label>
                    <input type="password" class="form-control" id="post-pass" name="postPass" placeholder="비밀번호를 입력하세요">
                </div>
                <div>
                    <input type="hidden" name="postIdx" value="${idx}">
                    <input type="hidden" name="postMode" value="${mode}">
                </div>
                <div class="my-3 d-grid gap-3">
                    <button type="submit" class="btn btn-success">확인</button>
                    <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="/layout/footer.jsp"%>
</body>
</html>
