<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String popupMode = "on";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠키를 이용한 팝업</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>


    <style>
        div#popup {
            position: absolute;
            top: 100px;
            left: 50px;
            color: yellow;
            width: 270px;
            height: 100px;
            background-color: gray;
        }

        div#popup>div {
            position: relative;
            background-color: #ffffff;
            top: 0px;
            border: 1px solid gray;
            padding: 10px;
            color: black;
        }
    </style>

    <script>
        $(document).ready(function() {
            // 닫기 버튼 클릭 시 팝업창 닫기
            $("#closeBtn").on("click", function() {
                $("#popup").hide();
            });
        });
    </script>
</head>
<body>
<div class="container">
    <h2>팝업 메인 페이지(ver 0.1)</h2>
    <%
        for (int i = 1; i <= 10; i++) {
            out.print("현재 팝업창은 " + popupMode + " 상태 입니다.<br>");
        }

        if (popupMode.equals("on")) {
    %>
    <div id="popup">
        <h2>공지사항 팝업입니다.</h2>
        <div>
            <form name="popFrm">
                <input type="checkbox" id="inactiveToday" value="1">하루 동안 열지 않음
                <input type="button" value="닫기" id="closeBtn">
            </form>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>





