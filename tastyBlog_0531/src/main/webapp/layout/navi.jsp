<%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col ms-4">
    <div class="list-group text-center" style="position: fixed">
        <a href="/tasty/TourList.do" class="list-group-item list-group-item-action">여행 / 맛집</a>
        <a href="/tasty/CafeList.do" class="list-group-item list-group-item-action">카페</a>
        <a href="/tasty/Visitlog.do" class="list-group-item list-group-item-action">방명록</a>
        <c:choose>
            <c:when test="${empty sessionScope.id}">
                <a href="/tasty/Login.do" class="list-group-item list-group-item-action">로그인</a>
            </c:when>
            <c:otherwise>
                <a href="/tasty/Logout.do" class="list-group-item list-group-item-action">로그아웃</a>
            </c:otherwise>
        </c:choose>
        <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-caret-up-fill"></i></a>
        <a href="#foot" class="list-group-item list-group-item-action"><i class="bi bi-caret-down-fill"></i></a>
    </div>
</div>
