package com.bitc.jsp_0425;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
    // 출력할 부분 받음
    // 쿠키 생성
    // 클라이언트로 데이터를 전송하기 위한 response 내장 객체와 쿠키 이름, 쿠키 값, 쿠키 유지 시간을 매개변수로 받음
    public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
        // 쿠키 생성
        Cookie cookie = new Cookie(cName, cValue);
        cookie.setPath("/");
        cookie.setMaxAge(cTime);    // 쿠키 유지 시간, 0을 입력 시 쿠키 제거
        response.addCookie(cookie); // 클라이언트로 전송하기 위해 response 내장 객체에 쿠키 추가
    }

    // 쿠키 읽어 오기
    // 클라이언트에서 전송된 데이터를 가지고 있는 request 내장 객체와 쿠키 이름을 매개변수로 받음
    public static String readCookie(HttpServletRequest request, String cName) {
        String cookieValue = "";

        // 모든 쿠키 데이터 가져오기
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {  // 향상된 for 문으로 쿠키값 가져오기
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                // 지정한 쿠키 이름과 같을 경우 변수에 쿠키값 저장
                if (cookieName.equals(cName)) {
                    cookieValue = c.getValue();
                }
            }
        }
        return cookieValue;
    }

    // 쿠키 정보 삭제
    // 클라이언트에게 데이터를 전달할 response 내장 객체와 쿠키 이름을 매개변수로 받음
    public static void deleteCookie(HttpServletResponse response, String cName) {
        // 미리 만들어 놓은 makeCookie 메소드를 이용하여 쿠키 정보를 삭제
        // 쿠키 유지 시간을 0으로 설정 시 쿠키 정보 삭제
        makeCookie(response, cName, "", 0);
    }
}
