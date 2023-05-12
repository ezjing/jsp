package com.bitc.jsp_0512;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet2 extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
            IOException {
        /* request 영역에 message 라는 이름으로 데이터 추가 */
        req.setAttribute("message", "Hello Servlet..!!");
        /* 지정한 페이지로 이동 */
        req.getRequestDispatcher("/HelloServlet2.jsp").forward(req, resp);
    }
}
