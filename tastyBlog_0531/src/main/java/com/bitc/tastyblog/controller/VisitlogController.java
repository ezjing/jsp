package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.VisitlogDAO;
import com.bitc.tastyblog.model.VisitlogDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/tasty/Visitlog.do")
public class VisitlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        VisitlogDAO dao = new VisitlogDAO();
        List<VisitlogDTO> visitlogList = dao.selectVisitlogList();
        dao.dbClose();

        req.setAttribute("visitlogList", visitlogList);

        req.getRequestDispatcher("/view/visitlog.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
