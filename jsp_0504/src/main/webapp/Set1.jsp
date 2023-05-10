<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오후 3:16
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--  jstl을 사용하기 위해서 태그라이브러리 등록  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*" %>
<%--  자바빈즈 사용을 위해서 클래스 가져오기  --%>
<%@ page import="com.bitc.jsp_0504.Person" %>
<html>
<head>
    <title>JSTL - set 1</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <%--  jstl을 사용하여 기본 내장 객체인 page에 저장  --%>
    <%--  jstl을 사용하여 변수 direcVar을 선언하고 정수 100을 저장  --%>
    <c:set var="directVar" value="100" />
    <%--  jstl을 사용하여 변수 elVar을 선언하고 el언어(표현언어)를 사용하여 기존 생성한 변수 directVar을 가져와서 연산 후 저장  --%>
    <c:set var="elVar" value="${directVar mod 5}" />    <%--  없는 값 0출력  --%>
    <%--  jstl을 사용하여 변수 expVar을 선언하고 jsp의 표현식을 사용하여 객체 생성하여 저장  --%>
    <c:set var="expVar" value="<%=new Date()%>" />
    <%--  jstl을 사용하여 변수 betweenVar을 선언하고 시작 태그와 끝 태그 사이에 데이터를 입력하여 저장  --%>
    <c:set var="betweenVar">변수값 요렇게 설정</c:set>

    <h4>EL을 이용해 변수 출력</h4>
    <ul>
        <%--  jstl을 사용하여 내장 객체(page 영역)에 저장된 변수 값을 출력  --%>
        <li>directVar : ${pageScope.directVar}</li>
        <%--  jstl을 사용하여 내장 객체(page 영역)에 저장된 변수 값을 출력, 영역 지정이 없으면 기본 영역의 변수 출력  --%>
        <li>elVar : ${elVar}</li>
        <li>expVar : ${expVar}</li>
        <li>betweenVar : ${betweenVar}</li>
    </ul>

    <h4>자바빈즈 생성 1 - 생성자 사용</h4>
    <%--  jstl을 사용하여 자바빈즈 변수 생성, value 속성에서 jsp 표현식으로 자바 객체를 생성(자바클래스의 객체를 jsp에서 자바빈즈라고 칭함), request 내장 객체에 저장  --%>
    <c:set var="personVar1" value='<%=new Person("박문수", 50)%>' scope="request"></c:set>
    <ul>
        <%--  jstl을 사용하여 생성한 자바빈즈 personVar1의 필드 name 출력  --%>
        <li>이름 : ${requestScope.personVar1.name}</li>
        <li>나이 : ${personVar1.age}</li>
    </ul>

    <h4>자바빈즈 생성 2 - target</h4>
    <%--  jstl을 사용하여 자바빈즈 변수 생성(기본생성자 사용 데이터 없음)  --%>
    <c:set var="personVar2" value="<%= new Person()%>" scope="request"></c:set>
    <%--  jstl을 사용하여 생성된 자바빈즈를 target 속성으로 설정하고, property, value로 데이터를 입력  --%>
    <c:set target="${personVar2}" property="name" value="정약용"></c:set>
    <c:set target="${personVar2}" property="age" value="6"></c:set>
    <ul>
        <li>이름 : ${personVar2.name}</li>
        <li>나이 : ${requestScope.personVar2.age}</li>
    </ul>
</div>
</body>
</html>
