package com.bitc.tastyblog.controller;

import com.bitc.tastyblog.model.AccountDAO;
import com.bitc.tastyblog.model.AccountDTO;
import com.bitc.tastyblog.util.CookieManager;
import com.bitc.tastyblog.util.JSFunc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/tasty/Login.do")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//         select * from table when id pw ;일치할떄 가져와라 오류나면 메시지 출력하고싶은데
        String id = req.getParameter("userId");
        String pw = (req.getParameter("userPw"));
        String save = req.getParameter("save");

        AccountDAO dao = new AccountDAO();

        boolean confirmed = dao.equalsPassword(id, pw);

        if (confirmed) {
            if (save != null && save.equals("Y")) {
                CookieManager.makeCookie(resp, "loginId", id, 86400);
            }
            else {
                CookieManager.deleteCookie(resp, "loginId");
            }

            AccountDTO account = dao.selectUser(id, pw);
            dao.dbClose();

            HttpSession session = req.getSession(); // 세션영역에 저장하기 위한 변수 선언
            session.setAttribute("id", account.getId());
            session.setAttribute("pw", account.getPw());
            session.setAttribute("name", account.getName());
            session.setAttribute("nick", account.getNick());
            session.setAttribute("accountNum", account.getAccountNum());
            session.setMaxInactiveInterval(3600);
            JSFunc.alertLocation(resp, session.getAttribute("name") + "님 로그인 되었습니다.", "/tasty/Home.do");
        }
        else {
            JSFunc.alertBack("아이디나 비밀번호가 다릅니다.", resp);
        }
    }
}
