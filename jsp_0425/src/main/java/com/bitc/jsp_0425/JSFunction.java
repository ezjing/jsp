package com.bitc.jsp_0425;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
    // 메시지 알림창을 띄운 후 명시한 URL로 이동
    public static void alertLocation(String msg, String url, JspWriter out) {
        // location.href : 자바스크립트에서 지원하는 원하는 페이지로 이동 명령
        try {
            String script = ""
                    + "<script>"
                    + "    alert('" + msg + "');"
                    + "    location.href='" + url + "';"    // location.href <a>와 동일
                    + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }

    // 메시지 알림창을 띄운 후 이전 페이지로 돌아감
    public static void alertBack(String msg, JspWriter out) {
        // history.back() : 자바스크립트에서 지원하는 이전 페이지로 이동 명령
        try {
            String script = ""
                    + "<script>"
                    + "    alert('" + msg + "');"
                    + "    history.back();" // 웹페이지의 뒤로가기 기능과 동일
                    + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }
}



