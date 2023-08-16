package com.sist.commons;

import org.springframework.util.PatternMatchUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorizationInterceptor extends HandlerInterceptorAdapter {
    private static final String[] whiteList = {
            "/mingle/main/main.do",
            "/mingle/mento/*",
            "/mingle/space/*",
            "/mingle/study/*",
            "/mingle/auth/*"
    };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        String uri = request.getRequestURI();

        if(id == null){ // login 하지 않은 경우
            if(!isWhiteList(uri)){ // login이 필요한 요청일 경우
                response.sendRedirect("/mingle/auth/login_require.do");
                return false;
            }
        }
        else{
            if(isDuplicatedAuthentication(uri)){
                response.sendRedirect("/mingle/main/main.do");
                return false;
            }
        }
        return true;
    }

    private boolean isDuplicatedAuthentication(String uri){
        return PatternMatchUtils.simpleMatch("/mingle/auth/*", uri) &&
                !PatternMatchUtils.simpleMatch("/mingle/auth/logout.do", uri);
    }

    private boolean isWhiteList(String uri){
        return PatternMatchUtils.simpleMatch(whiteList, uri);
    }
}