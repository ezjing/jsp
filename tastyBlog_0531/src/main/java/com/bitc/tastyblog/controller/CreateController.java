package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.AccountDAO;
import com.bitc.tastyblog.model.AccountDTO;
import com.bitc.tastyblog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tasty/Create.do")
public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        AccountDTO account = new AccountDTO();

        // id pw name nink
        account.setId(req.getParameter("userId"));
        account.setPw(req.getParameter("userPw"));
        account.setName(req.getParameter("userName"));
        account.setNick(req.getParameter("userNick"));

        String passcheck = req.getParameter("userPwch");

        AccountDAO dao = new AccountDAO();

        int result = dao.insertAccount(account);
        dao.dbClose();

        if (result == 1) {
            JSFunc.alertLocation(resp, "회원가입이 완료되었습니다.", "/tasty/Home.do");
        }
        else {
            JSFunc.alertBack("양식을 다시한번 확인하십시오.", resp);
        }
    }
}
