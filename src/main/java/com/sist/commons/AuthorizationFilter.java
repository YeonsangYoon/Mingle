package com.sist.commons;

import org.springframework.util.PatternMatchUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizationFilter implements Filter {
    // white list : 모든 사용자 접근 가능 url
    private static final String[] whiteList = {
            // 메인 화면
            "/mingle/main/main.do",
            // 정적 리소스
            "/mingle/css/*",
            "/mingle/fonts/*",
            "/mingle/images/*",
            "/mingle/img/*",
            "/mingle/js/*",
            "/mingle/sass/*",
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

    private boolean isWhiteList(String uri){
        return PatternMatchUtils.simpleMatch(whiteList, uri);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // request, response, session 객체
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        // UserId, 요청 uri 추출
        String id = (String)session.getAttribute("id");
        String uri = request.getRequestURI();

        if(!isWhiteList(uri)){ // 요청 url이 whitelist가 아닌 경우
            if(id == null){ // 로그인 안됐을 경우 redirect
                response.sendRedirect("/mingle/auth/login_require.do");
                return;
            }
            else if(PatternMatchUtils.simpleMatch("/mingle/admin/*", uri)
                    && !id.equals("admin")){ // 관리자가 아닌 유저가 관리자 페이지에 접근한 경우
                response.sendRedirect("/mingle/auth/admin_require.do");
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}