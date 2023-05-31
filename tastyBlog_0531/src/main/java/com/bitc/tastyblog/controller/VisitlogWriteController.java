package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.VisitlogDAO;
import com.bitc.tastyblog.model.VisitlogDTO;
import com.bitc.tastyblog.util.FileUtils;
import com.bitc.tastyblog.util.JSFunc;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/tasty/VisitlogWrite.do")
public class VisitlogWriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(); // 내장객체인 세션영역을 사용하기 위한 변수 선언
        if (session.getAttribute("id") == null) {   // 세션영역 id 가 비어있으면 경고 출력
            JSFunc.alertLocation(resp, "로그인 후 이용하십시오.", "/tasty/Login.do");
        }
        else {
            req.getRequestDispatcher("/view/visitlogWrite.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String saveDir = "C:\\upload";
        int maxSize = 10 * 1024 * 1024;
        MultipartRequest mr = FileUtils.uploadFile(req, saveDir, maxSize);

        if (mr == null) {
            JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "/tasty/VisitlogWrite.do");
        }

        VisitlogDTO visitlog = new VisitlogDTO();

        visitlog.setContent(mr.getParameter("content"));
        visitlog.setNick(mr.getParameter("nick"));
        visitlog.setAccountNum(Integer.parseInt(mr.getParameter("accountNum")));

        // 방명록 파일업로드 고민중
//        String fileName = mr.getFilesystemName("file");
//
//        if (fileName != null) {
//            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  // 날짜 형식 지정
//            String ext = fileName.substring(fileName.lastIndexOf(".")); // 파일 이름 자르기(확장자만 남게됨)
//            String newFileName = now + ext; // 새 파일 이름 생성(날짜 + 확장자)
//
//            File oldFile = new File(saveDir + File.separator + fileName);   // 옛날 파일이름에 경로 지정
//            File newFile = new File(saveDir + File.separator + newFileName);    //새 파일이름에 경로 지정
//            oldFile.renameTo(newFile);
//
//            visitlog.setOfile(fileName);
//            visitlog.setSfile(newFileName);
//        }

        VisitlogDAO dao = new VisitlogDAO();

        int result = dao.insertVisitlog(visitlog);
        dao.dbClose();

        if (result == 1) {
            resp.sendRedirect("/tasty/Visitlog.do");
        }
        else {
            resp.sendRedirect("/tasty/VisitlogWrite.do");    // 오류 났을때 다시 글 쓰란 의미
        }
    }
}
