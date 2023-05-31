<%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="container-fluid border-top mt-5" id="foot">
    <div class="container-md">
        <div class="row mt-5">
            <div class="col-8">
                <div class="row">
                    <div class="col">
                        <span class="me-3"><a href="/tasty/TourList.do" class="text-decoration-none text-black">여행/맛집</a></span>
                        <span class="me-3"><a href="/tasty/CafeList.do" class="text-decoration-none text-black">카페</a></span>
                        <span class="me-3"><a href="/tasty/Visitlog.do" class="text-decoration-none text-black">방명록</a></span>
                        <span class="me-3"><a href="/tasty/Create.do" class="text-decoration-none text-black">회원가입</a></span>
                        <c:choose>
                            <c:when test="${empty sessionScope.id}">
                                <span class="me-3"><a href="/tasty/Login.do" class="text-decoration-none text-black">로그인</a></span>
                            </c:when>
                            <c:otherwise>
                                <span class="me-3"><a href="/tasty/Logout.do" class="text-decoration-none text-black">로그아웃</a></span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <p>Blog Author: 이지원 / TEL. 010.1234.5678 / 부산 전포동</p>
                <p>COPYRIGHT© FULLSTACK, ALL RIGHT RESERVED.</p>
            </div>
            <div class="col-4">
                <img src="/view/footer.PNG" alt="" class="float-end">
            </div>
        </div>
    </div>
</footer>