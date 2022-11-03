package com.gg.egov.filter;

import com.gg.egov.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.http.HttpRequest;

public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String uri = request.getRequestURI();
        System.out.println(uri);

        //1、如果路径中含有login、网站名的字符，放行
        if (uri.indexOf("login") != -1 || uri.equals("/EGOV/") || uri.equals("/logout")){
            chain.doFilter(req,resp);
            return;
        }
        //2、如果有令牌
        HttpSession session = request.getSession(false);
        try{
            if (session.getAttribute("user") != null){
                chain.doFilter(req,resp);
                return;
            }else {
                //非法闯入
                request.setAttribute("withoutLogin","本系统禁止恶意登陆，请通过用户登陆进入系统！");
//                response.sendRedirect("/EGOV/login.jsp");
                request.getRequestDispatcher("../login.jsp").forward(req,resp);//路径问题要研究清楚。。
            }
        }catch (Exception e){
            //session过期可能会导致令牌失效。空指针异常
        }
//        //3、从选择投资人页面进
//        if (uri.equals("/EGOV/loginError.jsp")){
//            chain.doFilter(req,resp);
//            return;
//        }
//        //4、从分页查询企业页面进
//        if (uri.equals("/EGOV/servlet/pageQueryEnterprise")|| uri.equals("/EGOV/auth/orgcodeSelect.jsp")){
//            chain.doFilter(req,resp);
//            return;
//        }


    }

    public void init(FilterConfig config) throws ServletException {

    }
}
