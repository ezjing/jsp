package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// jsp 파일은 재시작 필요 없는데 서블릿 파일은 서버가 변경된것 이기 때문에 늘 재시작 해줘야 한다
@WebServlet(value = "/servlet/FormProcess.do")
public class FormProcess extends HttpServlet {

    // get 방식(URL 주소 쿼리 스트링에 데이터 넣어 보내는 것)으로 요청 시 처리하는 메소드
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");

        req.setAttribute("userName", userName);
        req.setAttribute("userEmail", userEmail);
        req.setAttribute("type", "get");

        req.getRequestDispatcher("/servlet/formResult.jsp").forward(req, resp);
    }

    // post 방식(body에 데이터 넣어 보내는 것 form 태그 같은 것)으로 요청 시 처리하는 메소드
    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");

        req.setAttribute("userName", userName);
        req.setAttribute("userEmail", userEmail);
        req.setAttribute("type", "post");

        req.getRequestDispatcher("/servlet/formResult.jsp").forward(req, resp);
    }
}
