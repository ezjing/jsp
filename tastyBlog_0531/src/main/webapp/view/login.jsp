<%@ page import="com.bitc.tastyblog.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String loginId = CookieManager.readCookie(request, "loginId");

    String cookieCheck = "";
    if (!loginId.equals("")) {
        cookieCheck = "checked";
    }
%>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--  제이쿼리 CDN  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <script>
        $(document).ready(function () {
            $("#btn-back").on("click", function () {
                history.back();
            })
        });
    </script>
</head>
<body>
<div class="container-md">
    <h3 class="text-center my-5">맛도리 블로그 로그인</h3>
    <div class="row justify-content-center">
        <div class="col-4">
            <form action="/tasty/Login.do" method="post">
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="bi bi-person-fill" style="font-size: 2em"></i></span>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디 입력" value="<%=loginId%>">
                        <label for="user-id">Userid</label>  <%--  플로팅 라벨은 라벨 인풋태그 뒤에 써야함  --%>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text"><i class="bi bi-key-fill" style="font-size: 2em"></i></span>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호 입력">
                        <label for="user-pw">Userpw</label>
                    </div>
                </div>
                <div class="form-check">
                    <label for="" class="form-check-label">아이디 저장하기</label>
                    <input type="checkbox" class="form-check-input" id="" name="save" value="Y" <%=cookieCheck%>>
                </div>
                <div class="d-grid gap-2 my-3">
                    <button type="submit" class="btn btn-primary p-2">로그인</button>
                    <button type="button" class="btn btn-secondary p-2" id="btn-back">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
