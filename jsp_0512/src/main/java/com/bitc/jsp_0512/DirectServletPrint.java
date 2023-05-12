package com.bitc.jsp_0512;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/* HttpServlet 클래스를 상속받아 해당 클래스를 서블릿 클래스로 사용 */
/* @WebServlet 어노테이션을 사용하여 사용자 요청 주소를 설정 */
@WebServlet("/Servlet/DirectServletPrint.do")
public class DirectServletPrint extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        PrintWriter out = resp.getWriter();
        out.println("<html lang='ko'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>jsp 없이 직접 출력</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>서블릿에서 직접 내용 출력</h2>");
        out.println("<p>jsp로 포워드하지 않고 view 내용을 서블릿에서 직접 작성하여 출력</p>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}
