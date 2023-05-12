<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-11
    Time: 오전 10:39
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  xml 태그 로드  --%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
<head>
    <title>JSTL - xml</title>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"--%>
<%--            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"--%>
<%--            crossorigin="anonymous"></script>--%>
</head>
<body>
<div class="container">
    <%--  xml 정보가 있는 파일 내용 가져오기  --%>
    <%--  page 영역의 변수 booklist에 저장  --%>
    <c:import url="http://localhost:8080/BookList.xml" var="booklist" charEncoding="UTF-8"></c:import>    <%--  import : 표현부와 결과값 가져오기  --%>

<%--    <c:set var="booklist">--%>
<%--        <booklist>--%>
<%--            <book>--%>
<%--                <name>사피엔스</name>--%>
<%--                <author>유발 하라리</author>--%>
<%--                <price>19800</price>--%>
<%--            </book>--%>
<%--            <book>--%>
<%--                <name>총,균,쇠</name>--%>
<%--                <author>제러드 다이아몬드</author>--%>
<%--                <price>25200</price>--%>
<%--            </book>--%>
<%--        </booklist>--%>
<%--    </c:set>--%>

    <%--  변수 booklist에 저장된 xml 정보를 파싱, page 영역의 변수 blist에 저장  --%>
    <x:parse xml="${booklist}" var="blist"></x:parse>

    <h4>파싱 1</h4>
    <%--  select 속성을 사용하여 xml 내용 중 지정한 태그를 선택(select 부분 중괄호 사용X)(인덱스처럼 0번부터 시작하는거 아님)  --%>
    제목 : <x:out select="$blist/booklist/book[1]/name"></x:out> <br>
    저자 : <x:out select="$blist/booklist/book[1]/author"></x:out> <br>
    가격 : <x:out select="$blist/booklist/book[1]/price"></x:out> <br>

    <h4>파싱 2</h4>
    <table border="1">
        <tr>
            <th>제목</th>
            <th>저자</th>
            <th>가격</th>
        </tr>
        <%--  반복 실행을 위해서 select 속성을 태그를 지정, 아래에서 사용할 변수를 설정. (형태는 다르지만 발전된 for문 기능이라고 보면 됨. items 대신 select)  --%>
        <x:forEach select="$blist/booklist/book" var="item">
            <tr>
                <td><x:out select="$item/name"></x:out></td>
                <td><x:out select="$item/author"></x:out></td>
                <td>
                    <%--  choose, whem, otherwise를 사용하여 if ~ else 문 구현  --%>
                    <x:choose>
                        <x:when select="$item/price >= 20000">
                        2만 원 이상 <br>
                        </x:when>
                        <x:otherwise>
                            2만 원 미만 <br>
                        </x:otherwise>
                    </x:choose>
                </td>
            </tr>
        </x:forEach>
    </table>

    <h4>파싱 3</h4>
    <table border="1">
        <x:forEach select="$blist/booklist/book" var="item">
            <tr>
                <td><x:out select="$item/name"></x:out></td>
                <td><x:out select="$item/author"></x:out></td>
                <td><x:out select="$item/price"></x:out></td>
                <td><x:if select="$item/name = '총,균,쇠'">구매함</x:if></td>
            </tr>
        </x:forEach>
    </table>
</div>
</body>
</html>
