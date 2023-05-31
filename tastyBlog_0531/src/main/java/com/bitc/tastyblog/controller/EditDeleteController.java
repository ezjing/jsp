package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.TourDAO;
import com.bitc.tastyblog.model.TourDTO;
import com.bitc.tastyblog.util.FileUtils;
import com.bitc.tastyblog.util.JSFunc;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/tasty/EditDelete.do")
public class EditDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num = Integer.parseInt(req.getParameter("num"));
        int accountNum = Integer.parseInt(req.getParameter("accountNum"));  // 게시글을 쓴 id 의 accountNum
        String mode = req.getParameter("mode");

        TourDAO dao = new TourDAO();

        HttpSession session = req.getSession();

        int userNum = (int)session.getAttribute("accountNum");    // id 계정 번호 저장, 이거때문에 비로그인 유저가 클릭하면 오류 남 어떡하지..

        // id가 일치하거나 관리자 계정인 경우 실행(userNum이 1인 경우는 관리자가 로그인 한 것)
        if (userNum == accountNum || userNum == 1) {
            // 수정 페이지로 이동
            if (mode.equals("edit")) {
                TourDTO tour = dao.selectTourDetail(num);
                dao.dbClose();

                req.setAttribute("tour", tour);

                // sendRedirect는 request 영역 전달 X, forward는 request 영역 전달 O (399p 참고)
                req.getRequestDispatcher("/view/edit.jsp?num=" + num).forward(req, resp);
            }
            else if (mode.equals("delete")) {   // 현재 게시글 삭제
                int result = dao.deleteTour(num);
                dao.dbClose();

                if (result == 1) {
                    JSFunc.alertLocation(resp, "삭제되었습니다.", "/tasty/TourList.do");
                }
                else {
                    resp.sendRedirect("/tasty/TourRead.do?num=" + num);
                }
            }
        }
        // 권한없는 유저 접근 시
        else {
            String js = "<script>";
            js += "alert('잘못된 접근입니다.');";
            js += "history.back();";
            js += "</script>";

            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println(js);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String saveDir = "C:\\upload";
        int maxSize = 10 * 1024 * 1024;
        MultipartRequest mr = FileUtils.uploadFile(req, saveDir, maxSize);

        if (mr == null) {
            JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "/mvcBoard/Write.do");
        }

        TourDTO tour = new TourDTO();

        // edit.jsp 에서 form 으로 전송받은 데이터 (int 타입은 파싱해야함)
        tour.setTitle(mr.getParameter("title"));
        tour.setContent(mr.getParameter("content"));
        tour.setAccountNum(Integer.parseInt(mr.getParameter("accountNum")));
        tour.setWriteNum(Integer.parseInt(mr.getParameter("writeNum")));

        String fileName = mr.getFilesystemName("file");

        if (fileName != null) {
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());  // 날짜 형식 지정
            String ext = fileName.substring(fileName.lastIndexOf(".")); // 파일 이름 자르기(확장자만 남게됨)
            String newFileName = now + ext; // 새 파일 이름 생성(날짜 + 확장자)

            File oldFile = new File(saveDir + File.separator + fileName);   // 옛날 파일이름에 경로 지정
            File newFile = new File(saveDir + File.separator + newFileName);    //새 파일이름에 경로 지정
            oldFile.renameTo(newFile);

            tour.setOfile(fileName);
            tour.setSfile(newFileName);
        }
        else {
            tour.setOfile(mr.getParameter("ofile"));
            tour.setSfile(mr.getParameter("sfile"));
        }

        TourDAO dao = new TourDAO();

        int result = dao.updateTour(tour);
        dao.dbClose();

        if (result == 1) {
            JSFunc.alertLocation(resp, "수정되었습니다.", "/tasty/TourList.do");
        }
        else {
            JSFunc.alertBack("잘못된 입력입니다.", resp);
        }
    }
}
