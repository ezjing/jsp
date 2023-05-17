package com.bitc.jsp_0517.servlet;

import com.bitc.jsp_0517.database.MemberDao;
import com.bitc.jsp_0517.database.MemberDto;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/servlet/MemberAuth.mvc")
public class MemberAuth extends HttpServlet {
    // 회원 정보를 데이터 베이스에서 제어하는 DAO 클래스 객체 변수 선언
    private MemberDao dao;

    @Override
    public void init() throws ServletException {
        // 객체 생성
        dao = new MemberDao();
        // 데이터 베이스 연결
        dao.dbOpen();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 관리자 계정 정보 가져오기
        String admin_id = "nakja";

        // 사용자 id, pw 전달 받기
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        // 데이터 베이스에서 해당 사용자 정보 가져오기
        // 데이터 베이스에 중보 중 id, pw가 일치하지 않으면 null을 반환
        MemberDto memberDto = dao.selectMember(id, pass);

        String memberName = memberDto.getUserName();

        // 사용자 이름이 있을 경우 일반 사용자
        if(memberName != null) {
            // request 영역에 데이터 추가 
            req.setAttribute("authMessage", memberName + "회원님 방가방가");
        }
        else {
            // 사용자가 입력한 id가 관리자 id와 같은지 확인
            if (admin_id.equals(id)) {
                req.setAttribute("authMessage", admin_id + "는 관리자입니다.");
            }
            // 아니면 회원아닙니다 출력
            else {
                req.setAttribute("authMessage", "당신은 회원이 아닙니다.");
            }
        }

        // 화면 출력을 위한 view 역할을 하는 jsp 페이지로 req, resp 정보를 가지고 이동(포워드)
        req.getRequestDispatcher("/servlet/MemberAuth.jsp").forward(req, resp);
    }

    // 서버 종료 시 데이터베이스 연결 종료
    @Override
    public void destroy() {
        dao.dbClose();
    }
}
