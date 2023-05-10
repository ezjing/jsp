<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오후 3:58
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - set 2</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h4>List 컬렉션 이용하기</h4>
    <%
        // List 타입으로 생성은 했지만 내장객체에 저장X, 표현식으로 출력해야함(표현언어는 내장객체에 저장된 데이터만 사용 가능)
        ArrayList<Person> pList = new ArrayList<Person>();
        pList.add(new Person("성삼문", 55));
        pList.add(new Person("박팽년", 60));
    %>
    <c:set var="personList" value="<%=pList%>" scope="request" />   <%-- 리퀘스트 영역에 저장  --%>
    <ul>
        <li>이름 : ${ requestScope.personList[0].name}</li>
        <li>나이 : ${personList[0].age}</li>
    </ul>

    <h4>Map 컬렉션 이용하기</h4>
    <%
        // Map 타입으로 생성은 했지만 내장객체에 저장X, 표현식으로 출력해야함(표현언어는 내장객체에 저장된 데이터만 사용 가능)
        Map<String, Person> pMap = new HashMap<String, Person>();
        pMap.put("personArgs1", new Person("하위지", 65));
        pMap.put("personArgs2", new Person("이개", 67));
    %>
    <c:set var="personMap" value="<%=pMap%>" scope="request" /> <%-- 리퀘스트 영역에 저장  --%>
    <ul>
        <li>이름 : ${ requestScope.personMap.personArgs2.name}</li>
        <li>나이 : ${personMap.personArgs2.age}</li>
    </ul>
</div>
</body>
</html>
