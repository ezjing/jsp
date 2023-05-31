package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.util.FileUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tasty/Download.do")
public class DownloadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");
        int num = Integer.parseInt(req.getParameter("num"));

        // 1. 파일 다운로드
        FileUtils.download(req, resp, "C:\\upload", sfile, ofile);
    }
}
