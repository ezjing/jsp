package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 사용자가 요청하는 URL 설정
@WebServlet(value="/servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {

    // 사용자 요청을 처리하는 메소드, doGet, doPost가 있음
    @Override
    protected void  doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // request 내장 객체에 지정한 이름으로 데이터 저장
        req.setAttribute("message", "@WebServlet 어노테이션으로 매핑");

        // 지정한 URL로 페이지 이동, view 페이지를 출력
        req.getRequestDispatcher("/servlet/AnnoMapping.jsp").forward(req, resp);
    }
}
