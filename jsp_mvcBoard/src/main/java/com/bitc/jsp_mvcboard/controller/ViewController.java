package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.model.MVCBoardDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mvcBoard/View.do")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 전달받은 게시물 번호 가져오기(전달될땐 전부 문자열로 들고옴)
        int idx = Integer.parseInt(req.getParameter("idx"));

        // 2. 데이터 베이스에 연결하여 해당 게시물의 조회수 업데이트
        MVCBoardDAO dao = new MVCBoardDAO();
        dao.updateBoardVisits(idx);


        // 3. 데이터 베이스에 연결하여 게시물 번호에 맞는 게시물 정보를 가져오기
        MVCBoardDTO board = dao.selectBoardDetail(idx);
        dao.dbClose();

        // 4. view 페이지에 데이터 전달(request 영역에 데이터 저장)
        req.setAttribute("board", board);

        req.getRequestDispatcher("/view/view.jsp").forward(req, resp);
    }
}
