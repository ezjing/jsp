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

@WebServlet("/tasty/CafeList.do")
public class CafeListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CafeDAO dao = new CafeDAO();
        List<CafeDTO> cafeList = dao.selectCafeList();
        dao.dbClose();

        req.setAttribute("cafeList", cafeList);

        req.getRequestDispatcher("/view/cafeList.jsp").forward(req, resp);
    }
}
