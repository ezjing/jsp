package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/tasty/Logout.do")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("id");
        session.removeAttribute("pw");
        session.removeAttribute("name");
        session.removeAttribute("nick");
        session.removeAttribute("accountNum");

        session.invalidate();

        JSFunc.alertLocation(resp, "로그아웃 되었습니다.", "/tasty/Home.do");
//        JSFunc.alertBack("로그아웃 되었습니다.", resp);
    }
}
