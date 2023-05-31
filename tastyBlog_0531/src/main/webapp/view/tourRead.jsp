<%@ page import="com.bitc.tastyblog.model.TourDAO" %><%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--  제이쿼리 CDN  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <script>
        $(document).ready(function() {
            location.href = "#hora";
        });
        <%--$(document).ready(function () {--%>
        <%--    location.href = "#hora";--%>
        <%--    $("#btn-edit").on("click", function () {--%>
        <%--        location.href = "/tasty/EditDelete.do?mode=edit&num=" + ${tour.writeNum};--%>
        <%--    });--%>

        <%--    $("#btn-delete").on("click", function () {--%>
        <%--        location.href = "/tasty/EditDelete.do?mode=delete&num=" + ${tour.writeNum};--%>
        <%--    });--%>
        <%--})--%>
    </script>
</head>
<body>
<header>
    <c:import url="/layout/header.jsp"></c:import>
</header>

<main>
    <div class="container-md">
        <div class="row my-5">
            <div class="col-10">
                <%--  리스트  --%>
                <table class="table table-hover text-center">
                    <colgroup>
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 35%">
                        <col style="width: 30%">
                        <col style="width: 10%">
                    </colgroup>
                    <thead>
                    <tr style="background-color: rgba(0,157,228,0.95);">
                        <th>no</th>
                        <th>name</th>
                        <th>title</th>
                        <th>date</th>
                        <th>visit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty tourList}">
                            <tr>
                                <td colspan="4">등록된 게시물이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tour" items="${tourList}" varStatus="loop">
                                <tr>
                                    <td>${tour.writeNum}</td>
                                    <td>${tour.name}</td>
                                    <td>
                                        <a href="/tasty/TourRead.do?num=${tour.writeNum}" class="text-decoration-none">${tour.title}</a>
                                    </td>
                                    <td>${tour.date}</td>
                                    <td>${tour.visit}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <div class="d-flex justify-content-end">
                    <a href="/tasty/Write.do" class="btn btn-primary">글쓰기</a>
                </div>

                    <%--  페이징  --%>
                    <%
                        TourDAO dao = new TourDAO();
                        // 전체 게시물 수
                        int totalTourCount = dao.totalTourCount();
                        // 현재 페이지에서 출력할 최대 게시물 수
                        int pageSize = 5;
                        // 현재 블록에서 표현할 페이지 수
                        int blockPage = 5;
                        // 전체 페이지 수
                        int totalPage = (int)Math.ceil((double)totalTourCount / pageSize);

                        // 현재 페이지 수 기본값(매객변수 아무거도 없으면)
                        int pageNum = 1;
                        // 게시물 페이지 번호를 요청 매개변수로 받음
                        String pageTemp = request.getParameter("pageNum");

                        // 현재 페이지 요청 시 클라이언트에서 전달된 데이터 중 pageNum의 값이 null이 아니거나 ""이 아닐 경우
                        // 변수 pageTemp의 값을 정수로 변경하여 pageNum 변수에 저장
                        if (pageTemp != null && !pageTemp.equals("")) {
                            pageNum = Integer.parseInt(pageTemp);
                        }

                        // 첫번째 게시물 번호
                        int start = (pageNum - 1) * pageSize + 1;
                        // 마지막 게시물 번호
                        int end = pageNum * pageSize;

                        // DB 연결 해제
                        dao.dbClose();
                    %>
                    <div class="my-3">
                        <ul class="pagination justify-content-center">
                            <%--  이전 페이지 버튼  --%>
                            <%
                                String pagingStr = "";  // 화면에 페이징 번호를 출력하기 위한 문자열 생성 변수
                                // pageNum : 현재 페이지 번호
                                // blockPage : 현재 블록에서 표현할 페이지 수
                                // temp : 계산된 페이지 번호를 저장할 변수
                                int temp = (((pageNum -1) / blockPage) * blockPage) + 1;

                                int writeNum = Integer.parseInt(request.getParameter("num"));

                                if (temp != 1) {
                                    pagingStr += "<li class='page-item'><a href='/tasty/TourRead.do?num=" + writeNum + "&pageNum=" + (temp - 1) + "' class='page-link'>이전 블록</a></li>";
                                }
                            %>

                            <%--  각 페이지 버튼  --%>
                            <%
                                // blockCount : 현재 블록의 카운트 기본값
                                // totalPage : 전체 페이지 수
                                int blockCount = 1;
                                while (blockCount <= blockPage && temp <= totalPage) {
                                    // 현재 페이지와 계산된 페이지 값이 같으면
                                    if (temp == pageNum) {
                                        // 현재 페이지 번호만 출력하고 링크는 사용하지 않음 (&nbsp; : html 특수기호 스페이스바)
                                        pagingStr += "<li class='page-item'><span class='page-link'>" + temp + "</span></li>";
                                    }
                                    else {
                                        // 계산된 페이지 번호에 링크를 적용
                                        pagingStr += "<li class='page-item'><a href='/tasty/TourRead.do?num=" + writeNum + "&pageNum=" + temp + "' class='page-link'>" + temp + "</a></li>";
                                    }
                                    temp++;
                                    blockCount++;
                                }
                            %>

                            <%--  다음 페이지 버튼  --%>
                            <%
                                if (temp <= totalPage) {
                                    pagingStr += "<li class='page-item'><a href='/tasty/TourRead.do?num=" + writeNum + "&pageNum=" + temp + "' class='page-link'>다음블록</a></li>";
                                }

                                // 화면 출력
                                out.println(pagingStr);
                            %>
                        </ul>
                    </div>

                <hr class="my-5" id="hora">

                <%--  본문  --%>
                <div class="container text-center">
                    <h3 class="text-center mt-5 mb-3">${tourR.title}</h3>
<%--                    <div class="clearfix">  &lt;%&ndash;  clearfix로 float 오류 해결  &ndash;%&gt;--%>
<%--                        <span class="float-start ms-5 ps-3">${tourR.name}</span>--%>
<%--                        <span class="float-start text-muted ms-3">${tourR.date}</span>--%>
<%--                        <div class="float-end">--%>
<%--                            <button class="btn btn-secondary btn-sm opacity-75">수정</button>--%>
<%--                            <button class="btn btn-secondary btn-sm opacity-75">삭제</button>--%>
<%--                        </div>--%>
<%--                        <span class="float-end me-5 pe-3">조회수 : ${tourR.visit}</span>--%>
<%--                    </div>--%>
                        <div class="d-flex align-items-center">
                            <span class="ms-5 ps-3">${tourR.name}</span>
                            <span class="text-muted ms-3">${tourR.date}</span>
                            <span class="ms-auto me-3">조회수 : ${tourR.visit}</span>
                            <div class="me-5 pe-3">
                                <a href="/tasty/EditDelete.do?mode=edit&num=${tourR.writeNum}&accountNum=${tourR.accountNum}" class="btn btn-secondary btn-sm opacity-75">수정</a>
                                <a href="/tasty/EditDelete.do?mode=delete&num=${tourR.writeNum}&accountNum=${tourR.accountNum}" class="btn btn-secondary btn-sm opacity-75">삭제</a>
                            </div>
                        </div>

                    <hr>

                    <c:choose>
                        <c:when test="${empty tourR.ofile}">
                        </c:when>
                        <c:otherwise>
                            <p class="text-end me-5 pe-5"><a href="/tasty/Download.do?ofile=${tourR.ofile}&sfile=${tourR.sfile}&num=${tourR.writeNum}">[첨부파일]</a></p>
                        </c:otherwise>
                    </c:choose>

                    <img src="/view/munsu2.jpg" class="my-3" alt="" style="width: 50%;">
                    <p class="my-3">${tourR.content}</p>

                    <img src="/view/noodle.jpg" class="my-3" alt="" style="width: 50%;">
                    <p class="my-3">${tourR.content}</p>
                </div>
            </div>
            <c:import url="/layout/navi.jsp"></c:import>
        </div>
        <%--  댓글기능 어떻게 할 지 생각 김치블로그 참고. 위에서 부터 목록 - 본문 - 댓글 순임  --%>
    </div>

</main>

<footer>
    <%@ include file="/layout/footer.jsp"%>
</footer>
</body>
</html>

