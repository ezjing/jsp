package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.TourDAO;
import com.bitc.tastyblog.model.TourDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/tasty/TourRead.do")
public class TourReadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TourDAO dao = new TourDAO();
        // 전체 게시물 수
        int totalTourCount = dao.totalTourCount();
        // 현재 페이지에서 출력할 최대 게시물 수
        int pageSize = 5;
        // 현재 블록에서 표현할 페이지 수
        int blockPage = 5;
        // 전체 페이지 수
        int totalPage = (int)Math.ceil((double)totalTourCount / pageSize);

        // 현재 페이지 수 기본값(매객변수 아무거도 없으면)
        int pageNum = 1;
        // 게시물 페이지 번호를 요청 매개변수로 받음
        String pageTemp = req.getParameter("pageNum");

        // 현재 페이지 요청 시 클라이언트에서 전달된 데이터 중 pageNum의 값이 null이 아니거나 ""이 아닐 경우
        // 변수 pageTemp의 값을 정수로 변경하여 pageNum 변수에 저장
        if (pageTemp != null && !pageTemp.equals("")) {
            pageNum = Integer.parseInt(pageTemp);
        }

        // 첫번째 게시물 번호
        int start = (pageNum - 1) * pageSize + 1;
        // 마지막 게시물 번호
        int end = pageNum * pageSize;

        // 게시물 전체 리스트 가져오기
        List<TourDTO> tourList = dao.selectTourList(start-1, pageSize);

        req.setAttribute("tourList", tourList);

        int num = Integer.parseInt(req.getParameter("num"));
        dao.updateTourVisits(num);

        TourDTO tour = dao.selectTourDetail(num);
        dao.dbClose();

        req.setAttribute("tourR", tour);

        req.getRequestDispatcher("/view/tourRead.jsp").forward(req, resp);
    }
}
