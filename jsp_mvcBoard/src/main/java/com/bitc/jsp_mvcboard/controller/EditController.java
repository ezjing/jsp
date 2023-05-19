package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.model.MVCBoardDTO;
import com.bitc.jsp_mvcboard.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mvcBoard/Edit.do")
public class EditController extends HttpServlet {

    // PassController에서 넘어온 수정 페이지
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 현재 페이지 정보가 그대로 있어야 함
        // 1. PassController에서 전달한 게시물 번호 가져오기
        int postIdx = Integer.parseInt(req.getParameter("idx"));

        // 2. 데이터베이스에 연결하여 게시물 번호를 기준으로 현재 글 정보 가져오기
        MVCBoardDAO dao = new MVCBoardDAO();
        MVCBoardDTO board = dao.selectBoardDetail(postIdx);
        dao.dbClose();

        // 3. request 영역에 게시물 정보를 저장하여
        req.setAttribute("board", board);

        req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
    }

    // 수정 페이지에서 접속할 서버 위치
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // 1. 수정 페이지에서 전달한 데이터 가져오기
        MVCBoardDTO board = new MVCBoardDTO();
        board.setPostIdx(Integer.parseInt(req.getParameter("postIdx")));
        board.setPostTitle(req.getParameter("postTitle"));
        board.setPostWriter(req.getParameter("postWriter"));
        board.setPostPass(req.getParameter("postPass"));
        board.setPostContent(req.getParameter("postContent"));

        // 2. 데이터 베이스 접속 및 전달된 데이터로 DB 수정하기
        MVCBoardDAO dao = new MVCBoardDAO();

        int result = dao.updateBoard(board);
        dao.dbClose();

        // 3. 페이지 이동
        if (result == 1) {
            JSFunc.alertLocation(resp, "수정되었습니다.", "/mvcBoard/List.do");    // 방법 1 : JSFunc 사용
//            resp.sendRedirect("/mvcBoard/List.do");   // 방법 2 : resp.sendRedirect 사용 (PassController.java 와 비교)
        }
        else {
            JSFunc.alertBack("잘못된 입력입니다.", resp);
//            resp.sendRedirect("/mvcBoard/Edit.do?idx=" + board.getPostIdx());
        }
    }
}
