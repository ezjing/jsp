<%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar py-0 max-width">
        <div class="container-fluid p-0 card">
            <img src="/view/air.jpg" class="card-img rounded-0" style="width: 100%; height: 15em;">
            <div class="card-img-overlay clearfix">
                <c:choose>
                    <c:when test="${empty sessionScope.id}">
                        <span class="float-end"><a href="/tasty/Login.do" class="text-white text-decoration-none">로그인</a></span>
                    </c:when>
                    <c:otherwise>
                        <span class="float-end"><a href="/tasty/Logout.do" class="text-white text-decoration-none">로그아웃</a></span>
                    </c:otherwise>
                </c:choose>
                <span class="float-end me-3"><a href="/tasty/Create.do" class="text-white text-decoration-none">회원가입</a></span>
            </div>
        </div>
    </nav>
    <nav class="navbar navbar-expand-sm" style="background-color: #e3f2fd;">
        <div class="container-fluid">
            <a href="/tasty/Home.do" class="navbar-brand">Home</a>
            <ul class="navbar-nav me-auto">
                <li class="nav-item mx-3"><a href="/tasty/TourList.do" class="text-decoration-none text-black">여행&맛집</a></li>
                <li class="nav-item mx-3"><a href="/tasty/CafeList.do" class="text-decoration-none text-black">카페</a></li>
                <li class="nav-item mx-3"><a href="/tasty/Visitlog.do" class="text-decoration-none text-black">방명록</a></li>
            </ul>
<%--            <form action="/tasty/Search.do" class="d-flex m-0" method="get">--%>
<%--&lt;%&ndash;                Home.do 에 post 로 받아옴 거기서 링크걸자 form을 통해 해당 주소나 아이디로 이동하게 만들면 됨 a태그같은거나&ndash;%&gt;--%>
<%--                <input type="search" class="form-control mx-2" placeholder="검색어를 입력하세요.">--%>
<%--                <button class="btn btn-outline-primary mx-2" type="submit">search</button>--%>
<%--            </form>--%>
            <form method="post" name="search" action="/tasty/Search.do" class="d-flex m-0">
                <table class="pull-right">
                    <tr>
                        <td>
<%--                            <div class="dropdown">--%>
<%--                                <button class="btn btn-primary dropdwon-toggle" type="button" data-bs-toggle="dropdown">선택</button>--%>
<%--                                <ul class="dropdown-menu">--%>
<%--                                    <li><a href="#" class="dropdown-item">제목</a></li>--%>
<%--                                    <li><a href="#" class="dropdown-item">작성자</a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                            <select class="form-control" name="searchField">
                                <option value="title">제목</option>
                                <option value="name">작성자</option>
                            </select>
                        </td>
                        <td><input type="text" class="form-control mx-2" placeholder="검색어 입력" name="searchText" maxlength="100"></td>
                        <td><button type="submit" class="btn btn-outline-primary mx-2">search</button></td>
                    </tr>

                </table>
            </form>
        </div>
    </nav>
</header>
