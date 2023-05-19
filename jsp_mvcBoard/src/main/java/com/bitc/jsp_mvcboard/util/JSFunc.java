package com.bitc.jsp_mvcboard.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class JSFunc {
    public static void alertBack(String msg, HttpServletResponse resp) {
        try {
            resp.setContentType("text/html;characters=UTF-8z");
            PrintWriter writer = resp.getWriter();

            String js = "<script>";
            js += "alert('" + msg + "'); ";
            js += "history.back(); ";
            js += "</script>";

            writer.print(js);
        }
        catch (IOException e) { }
    }

    public static void alertLocation(HttpServletResponse resp, String msg, String url) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            String js = "<script>";
            js += "alert('" + msg + "'); ";
            js += "location.href = '" + url + "'; " ;
            js += "</script>";

            writer.print(js);
        }
        catch (IOException e) {}
    }
}
