package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/* ~~~.one 형식 주소 다 받겠다 */
@WebServlet(value = "*.one")
public class FrontController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 서버주소를 제외한 전체 주소 가져오기
        String uri = req.getRequestURI();
        // 가져온 전체 주소에서 뒤에서부터 확인하여 '/' 문자가 있는 위치 가져오기
        int lastSlash = uri.lastIndexOf("/");   /* lastIndexOf : 제일 뒤에서부터 / 들어간거 찾는 메소드 */
        // 지정한 위치에서부터 문자열 잘라내기, 전체 주소에서 마지막 주소만 가져오기
        String commandStr = uri.substring(lastSlash);   /* substring 문자열 자르고 반환 */
        
        // 마지막 주소를 비교하여 원하는 처리를 하는 메소드 실행
        if (commandStr.equals("/regist.one")) {
            registFunc(req);
        }
        else if (commandStr.equals("/login.one")) {
            loginFunc(req);
        }
        else if (commandStr.equals("/freeboard.one")) {
            freeboardFunc(req);
        }

        // 공통적으로 처리할 내용
        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        
        // view 처리를 위해서 지정한 jsp 파일로 페이지 이동 (jsp 파일 경로를 불러와서 req, resp 포워드 시킴)
        req.getRequestDispatcher("/servlet/FrontController.jsp").forward(req, resp);
    }
    
    // 회원가입 페이지 처리
    void registFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>회원가입</h4>");
    }

    // 로그인 페이지 처리
    void loginFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>로그인</h4>");
    }

    // 자유게시판 페이지 처리
    void freeboardFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>자유게시판</h4>");
    }
}
