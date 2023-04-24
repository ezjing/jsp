package com.bitc.test1;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        response.setCharacterEncoding("UTF-8");

        // Hello
        PrintWriter out = response.getWriter();
        String html = "<html>";
        html += "<head>";
        html += "<meta http-equiv=\"Content-Type\" contetn=\"text/html\">";
        html += "<meta charaset='UTF-8'>";
        html += "<title>서블릿으로 웹 페이지 생성</title>";
        html += "</head><body>";
        html += "<h1>" + message +  "</h1>";
        html += "<h2>" + "안녕하세요 처음 만들어보는 JSP 페이지 입니다." + "</h2>";
        html += "</body></html>";
        out.println(html);


//        out.println("<html><body>");
//        out.println("<h1>" + message + "</h1>");
//        out.println("<h2>" + "안녕하세요 처음 만들어보는 JSP 페이지 입니다." + "</h2>");
//        out.println("</body></html>");
    }

    public void destroy() {
    }
}