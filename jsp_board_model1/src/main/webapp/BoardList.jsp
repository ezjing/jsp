<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 4:09
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDto" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDao" %>

<%@ page import="java.util.List" %>

<%--<%--%>
<%--    String userId = session.getAttribute("userId").toString();  // getAttribute는 문자열로 받아오기 때문에--%>
<%--    String userName = (String)session.getAttribute("userName");--%>

<%--    out.println("userid : " + userId);--%>
<%--    out.println("username : " + userName);--%>
<%--%>--%>

<%
    BoardDao dao = new BoardDao();
    // DB 연결
    dao.dbOpen();
    // 전체 게시물 수
    int totalCount = dao.totalCount();
    // 현재 페이지에서 출력할 최대 게시물 수
    int pageSize = 3;
    // 현재 블록에서 표현할 페이지 수
    int blockPage = 5;
    // 전체 페이지 수
    int totalPage = (int)Math.ceil((double)totalCount / pageSize);

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

    // 게시물 전체 리스트 가져오기
//    List<BoardDto> boardList = dao.selectList();
    List<BoardDto> boardList = dao.selectList(start, pageSize);
    // DB 연결 해제

    dao.dbClose();
%>
<html>
<head>
    <title>model1 방식 게시판 만들기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="Header.jsp" %>

<main class="container my-4 p-0">
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>글쓴이</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <%
            // 가져온 게시물 크기 확인
            if (boardList.size() != 0) {
            // 게시물이 있으면 반복문으로 출력
            for (BoardDto dto : boardList) {
        %>
        <tr>
            <td><%=dto.getPostNum()%></td>
            <%--  제목 표시 부분에 해당 글을 읽기 위한 링크를 설정  --%>
            <td><a href="BoardRead.jsp?postNum=<%=dto.getPostNum()%>" class="text-decoration-none"><%=dto.getPostTitle()%></a></td> <%--  링크 걸때언제 ./ 넣고 안넣는지 의문  --%>   <%--  form 안쓰고 a태그에 직접 주소 다 입력해서 이동하는 경우  --%>
            <td><%=dto.getPostWriteUser()%></td>
            <td><%=dto.getPostDate()%></td>
            <td><%=dto.getPostVisitCount()%></td>
        </tr>
        <%
            }
        }
            else {
        %>
<%--  게시물이 없으면  --%>
        <tr>
            <td colspan="5">게시물이 없습니다.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="my-3">
        <%--  이전 페이지 버튼  --%>
        <%
            String pagingStr = "";  // 화면에 페이징 번호를 출력하기 위한 문자열 생성 변수
            // pageNum : 현재 페이지 번호
            // blockPage : 현재 블록에서 표현할 페이지 수
            // temp : 계산된 페이지 번호를 저장할 변수
            int temp = (((pageNum -1) / blockPage) * blockPage) + 1;
            if (temp != 1) {
                pagingStr += "<a href='BoardList.jsp?pageNum=" + (temp - 1) + "'>이전 블록</a>";
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
                    pagingStr += "&nbsp;" + temp + "&nbsp;";
                }
                else {
                    // 계산된 페이지 번호에 링크를 적용
                    pagingStr += "&nbsp;<a href='BoardList.jsp?pageNum=" + temp + "'>" + temp + "</a>&nbsp;";
                }
                temp++;
                blockCount++;
            }
        %>

            <%--  다음 페이지 버튼  --%>
        <%
            if (temp <= totalPage) {
                pagingStr += "<a href='BoardList.jsp?page" + temp + "'>다음블록</a>";
            }

            // 화면 출력
            out.println(pagingStr);
        %>
    </div>
    <%@ include file="IsBoardBtn.jsp"%>
</main>

<%@ include file="Footer.jsp"%>

</body>
</html>
