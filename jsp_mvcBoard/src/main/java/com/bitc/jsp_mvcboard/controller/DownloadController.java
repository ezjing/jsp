package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.util.FileUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mvcBoard/Download.do")
public class DownloadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");
        int postIdx = Integer.parseInt(req.getParameter("idx"));

        // 1. 파일 다운로드
        FileUtils.download(req, resp, "C:\\upload", sfile, ofile);

        // 2. 데이터 베이스 연결 후 다운로드 수 업데이트
        MVCBoardDAO dao = new MVCBoardDAO();
        dao.updateBoardDownCount(postIdx);
        dao.dbClose();
    }
}
