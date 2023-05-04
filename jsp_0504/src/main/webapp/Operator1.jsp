<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오후 12:05
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 스크립틀릿에서 변수를 직접 선언, 표현언어에서는 사용 불가
    int num1 = 3;
    // 내장객체(page영역)에 저장
    pageContext.setAttribute("num2", 4);
    pageContext.setAttribute("num3", "5");
    pageContext.setAttribute("num4", "8");
%>
<html>
<head>
    <title>표현 언어(EL) - 연산자</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h3>변수 선언 및 할당</h3>
    스크립틀릿에서 선언한 변수 : ${num1} <br /> <%--  표현언어에서는 스크립틀릿에서 선언한 변수 사용 X, 표현언어는 무조건 내장객체에 저장한것을 사용하는 것임  --%>
    page 영역에 저장된 변수 : ${num2} <br />
    <%--  page 내장객체에 저장과 동시에 출력  --%>
    변수 할당 및 즉시 출력 : ${num1 = 7} <br />
    변수 할당한 것 출력 : ${num1} <br />
    <%--  page 내장객체에 저장 후 출력은 안함  --%>
    변수 할당 및 별도 출력 : ${num2 = 8;''} =>${num2} <br />
    num1 = ${num1}, num2 = ${num2}, num3 = ${num3}, num4 = ${num4}

    <h3>산술 연산자</h3>
    num1 + num2 : ${num1 + num2} <br />
    num1 - num2 : ${num1 - num2} <br />
    num1 * num2 : ${num1 * num2} <br />
    num3 / num4 : ${num3 / num4} <br />
    num3 div num4 : ${num3 div num4} <br />
    num3 % num4 : ${num3 % num4} <br />
    num3 mod num4 : ${num3 mod num4} <br />

    <h3>+ 연산자는 덧셈만 가능</h3>  <%--  문자열은 못 이어붙인다는 말 같음  --%>
    <%--  기존 자바 문법에서는 문자열과 다른 타입을 연산 시 문자열 연결 연산자로 동작  --%>
    <%--  표현 언어에서는 타입 변환이 자유롭기 때문에 아래의 연산이 정수끼리의 연산으로 동작  --%>
    num1 + "34" : ${num1 + "34"} <br />
    num2 + "이십" : \${num2 + "이십"} <br />
    "삼십" + "사십" : \${"삼십" + "사십"}

    <h3>비교 연산자</h3>
    <%--  기존의 자바 문법의 비교 연산자 및 표현 언어의 비교 연산자 사용 가능  --%>
    <%--  true, false 로 출력  --%>
    num4 > num3 : ${num4 gt num3} <br />
    num1 < num3 : ${num1 lt num3} <br />
    num2 >= num4 : ${num2 ge num4} <br />
    num1 == num4 : ${num1 eq num4}

    <h3>논리 연산자</h3>
    <%--  기존의 자바 문법의 논리 연산자 및 표현 언어의 논리 연산자 사용 가능  --%>
    <%--  true, false 로 출력  --%>
    num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4} <br />
    num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4} <br />
</div>
</body>
</html>
