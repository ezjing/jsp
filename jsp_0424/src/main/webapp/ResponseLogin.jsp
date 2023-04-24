<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-24
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - Response</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
<%--      클라이언트에서 전송한 사용자 id, pw를 가져옴 --%>
    <%
      String id = request.getParameter("user_id");
      String pwd = request.getParameter("user_pwd");

//      현재 데이터베이스 연결 부분이 없기 때문에 단순 문자열 비교로 로그인 id, pw를 구분
//        equalsIgnoreCase() : 문자열 비교시 대소문자 구분하지 않음
//        sendRedirect() : 지정한 웹페이지로 이동, 클라이언트에서 다시 지정한 페이지로 접속을 하는 것으로 데이터처리를 함, 현재 페이지에서 가지고 있던 request 정보를 공유하지 못함(클라이언트 A로 이동하라고 했다 리다이렉트가 B로 이동하라고 하면 클라이언트에게 B로 이동하라고 응답을 주게 되고, 클라이언트가 B로 이동하라고 하면서 B로 이동하게됨) (<a>, location 같은 기능)
//        getRequestDispatcher : 지정한 웹페이지로 이동, 서버에서 직접 지정한 페이지로 이동, 서버에서 직접 지정한 페이지로 이동, 현제 페이지의 request 정보를 가지고 이동함(데이터 공유) (클라이언트에서 A로 이동하라고 하고 서버에서 requestdispatcher를 만나 B로 이동하라고 하면 클라이언트로 다시 가지 않고 서버에서 바로 B를 클라이언트로 전송한다)
      if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
//          ResponseWelcome.jsp 페이지로 이동(sendRedirect()사용)
        response.sendRedirect("ResponseWelcome.jsp");
      }
      else {
//          ResponseMain.jsp 페이지로 이동(getRequestDispatcher()사용)
        request.getRequestDispatcher("ResponseMain.jsp?loginErr=1") // 지정한 아이디, 비번 입력 안되면 loginErr출력해서 ResponseMain전송
                .forward(request, response);
      }
    %>
  </div>
</body>
</html>
