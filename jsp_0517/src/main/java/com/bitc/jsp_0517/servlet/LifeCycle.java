package com.bitc.jsp_0517.servlet;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {

    /* 객체 생성 시 한번만 실행 */
    @PostConstruct
    public void myPostConstruct() {
        System.out.println("MyPostConstruct() 호출");;
    }

    /* 객체 생성 시 한번만 실행 */
    @Override
    public void init() throws ServletException {
        System.out.println("init() 호출");
    }

    /* service, doget, dopost 매개변수가 있기 때문에 실직적으로 동작함(만들어진 객체 계속 재활용) */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("service() 호출");
        super.service(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet() 호출");

        req.getRequestDispatcher("/servlet/LifeCycle.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost() 호출");

        req.getRequestDispatcher("/servlet/LifeCycle.jsp").forward(req, resp);
    }

    /* 서버가 꺼질때 차례대로 동작 */
    @Override
    public void destroy() {
        System.out.println("destroy() 호출");
    }

    @PreDestroy
    public void myPreDestroy() {
        System.out.println("myPreDestroy() 호출");
    }
}
