package com.sist.commons;

import org.springframework.util.PatternMatchUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorizationInterceptor extends HandlerInterceptorAdapter {
    // white list : 모든 사용자 접근 가능 url
    private static final String[] whiteList = {
            // 메인 화면
            "/mingle/main/main.do",
            // 인증 관련 요청
            "/mingle/auth/*",
            // 공지사항 관련 요청
            "/mingle/notice/list.do",
            "/mingle/notice/detail.do",
            // 공간 대여 관련 요청
            "/mingle/space/main.do",
            "/mingle/space/detail.do",
            "/mingle/space/list_vue.do",
            "/mingle/space/detail_vue.do",
            // 스터디 모집 관련 요청
            "/mingle/study/list.do",
            "/mingle/study/detail.do",
            "/mingle/study/list_vue.do",
            // 멘토링 관련 요청
            "/mingle/mento/mento_list.do",
            "/mingle/mento/mento_regist.do",
            "/mingle/mento/mento_list_vue.do",
            "/mingle/mento/mento_page_vue.do",
            "/mingle/mento/mento_detail_vue.do",
            "/mingle/mento/follow.do"
    };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        String uri = request.getRequestURI();

        if(!isWhiteList(uri)){ // 요청 url이 whitelist가 아닌 경우
            if(id == null){ // 로그인 안됐을 경우 redirect
                response.sendRedirect("/mingle/auth/login_require.do");
                return false;
            }
            else if(PatternMatchUtils.simpleMatch("/mingle/admin/*", uri)
                    && !id.equals("admin")){ // 관리자가 아닌 유저가 관리자 페이지에 접근한 경우
                response.sendRedirect("/mingle/auth/admin_require.do");
            }
        }
        return true;
    }

    private boolean isWhiteList(String uri){
        return PatternMatchUtils.simpleMatch(whiteList, uri);
    }
}