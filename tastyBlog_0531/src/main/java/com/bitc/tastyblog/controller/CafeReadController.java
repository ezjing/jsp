package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.CafeDAO;
import com.bitc.tastyblog.model.CafeDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/tasty/CafeRead.do")
public class CafeReadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CafeDAO dao = new CafeDAO();
        List<CafeDTO> cafeList = dao.selectCafeList();

        req.setAttribute("cafeList", cafeList);

        int num = Integer.parseInt(req.getParameter("num"));
        CafeDTO cafe = dao.selectCafeDetail(num);
        dao.dbClose();

        req.setAttribute("cafeR", cafe);

        req.getRequestDispatcher("/view/cafeRead.jsp").forward(req, resp);
    }

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//
//        req.getRequestDispatcher("/view/cafeRead.jsp").forward(req, resp);
//    }
}
