package com.example.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RememberMeInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //        컨트롤러 메소드 호출 전에 실행됨

        // 요청 사용자의 세션 가져오기
        HttpSession session = request.getSession();
        // 세션에 로그인 아이디가 있는지 확인하기
        String id = (String) session.getAttribute("id");
        // 세션에 아이디가 없으면 로그인 상태유지용 쿠키 정보 가져와서 세션에 저장하고
        // 현재 호출된 컨트롤러 메소드를 호출되도록 true 리턴함
        if(id == null){
            Cookie[] cookies = request.getCookies();
            if(cookies != null){
                for(Cookie cookie: cookies){
                    if(cookie.getName().equals("id")){
                        id = cookie.getValue();
                        // 로그인 인증 처리
                        session.setAttribute("id", id);
                    }
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //        컨트롤러 메소드 호출 후에 실행됨
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //        컨트롤러 메소드 호출되고 뷰 실행까지 완료된 이후 실행됨
    }
}
