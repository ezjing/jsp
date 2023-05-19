package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.model.MVCBoardDTO;
import com.bitc.jsp_mvcboard.util.FileUtils;
import com.bitc.jsp_mvcboard.util.JSFunc;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/mvcBoard/Write.do")
public class WriteController extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 따로 기능이 없으므로 바로 데이터 전송
        req.getRequestDispatcher("/view/write.jsp").forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // 1. 클라이언트에서 전송된 내용 가져오기
//        String title = req.getParameter("title");
//        String writer = req.getParameter("writer");
//        String pass = req.getParameter("pass");
//        String contents = req.getParameter("content");

        // 현재 파일 정보에 대한 내용이 없음
        // 파일 정보를 가져오는 처리가 필요함
//        String saveDir = req.getServletContext().getRealPath("/upload");  // 방법 1
        // 서버에 저장할 위치
        String saveDir = "C:\\upload";  // 방법 2
        // 업로드 파일 최대 용량 제한
        int maxSize = 10 * 1024 * 1024;
        // MultipartRequest 로 데이터 가져오기
        MultipartRequest mr = FileUtils.uploadFile(req, saveDir, maxSize);
        
        if (mr == null) {
            JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "/mvcBoard/write.do");
        }
        
        MVCBoardDTO board = new MVCBoardDTO();

        // board에 데이터 넣기
        board.setPostTitle(mr.getParameter("title"));   // 내장객체로 들고오는게 아니라 mr에 들어있는 데이터를 들고와야함
        board.setPostWriter(mr.getParameter("writer"));
        board.setPostPass(mr.getParameter("pass"));
        board.setPostContent(mr.getParameter("content"));

        String fileName = mr.getFilesystemName("file");

        if (fileName != null) {
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  // 날짜 형식 지정 
            String ext = fileName.substring(fileName.lastIndexOf(".")); // 파일 이름 자르기(확장자만 남게됨)
            String newFileName = now + ext; // 새 파일 이름 생성(날짜 + 확장자)

            File oldFile = new File(saveDir + File.separator + fileName);   // 옛날 파일이름에 경로 지정
            File newFile = new File(saveDir + File.separator + newFileName);    //새 파일이름에 경로 지정
            oldFile.renameTo(newFile);

            board.setPostOfile(fileName);
            board.setPostSfile(newFileName);
        }
        
        // MVCBoardDTO에 ofile, sfile에 정보가 없음
        // 파일은 나중에 구현


        // 2. 데이터 베이스 연결
        MVCBoardDAO dao = new MVCBoardDAO();

        // 3. 데이터 베이스에 전송된 내용 등록하기
        int result = dao.insertBoard(board);    // result에 넣기
        dao.dbClose();

        // 4. Insert 결과에 따라 리스트 페이지로 이동
        if (result == 1) {
            resp.sendRedirect("/mvcBoard/List.do");
        }
        else {
            resp.sendRedirect("/mvcBoard/Write.do");    // 오류 났을때 다시 글 쓰란 의미
        }

    }
}
