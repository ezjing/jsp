<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오전 11:34
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
<html>
<head>
    <title>표현 언어(EL) - 컬렉션</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <%
        List<Object> aList = new ArrayList<Object>();
        // List에 데이터 두개 넣은거임
        aList.add("청해진");
        aList.add(new Person("장보고", 28));
        pageContext.setAttribute("Ocean", aList);   // 페이지 영역에 오션이란 이름으로 리스트 저장

        Map<String, String> map = new HashMap<String, String>();
        map.put("한글", "훈민정음");
        map.put("Eng", "English");
        pageContext.setAttribute("King", map);  // 페이지 영역에 킹이란 이름으로 맵 저장
    %>
    <h2>List 컬렉션</h2>
    <ul>
        <li>0번째 요소 : ${Ocean[0]}</li>
        <li>1번째 요소 : ${Ocean[1].name} ${Ocean[1].age}</li>
        <%--  존재하지 않는 index의 데이터를 출력 시 오류가 발생하는 것이 아니라 무시  --%>
        <li>2번째 요소 : ${Ocean[2]}</li>
    </ul>
    <h2>Map 컬렉션</h2>
    <ul>
        <li>영문 Key : ${King["Eng"]}, ${King['Eng']}, ${King.Eng}</li>   <%--  다양한 방식의 표현 언어 사용법  --%>
        <%--  표현언어를 통해서 내장 객체에 저장된 속성을 출력 시 한글이나 특수 기호가 있으면 반드시 [] 사용  --%>
        <li>한글 Key : ${King["한글"]}, ${King['한글']}, \${King.한글}</li> <%--  특수문자, 한글은 대괄호가 들어가는 사용법을 사용해야한다(마지막 한글이 그래서 오류가 나는것이구 \는 화면에 출력해주기 위해서 붙인것. EL 코드의 주석 처리방법이다
        )  --%>
    </ul>
</div>
</body>
</html>
