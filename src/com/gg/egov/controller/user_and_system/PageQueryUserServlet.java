package com.gg.egov.controller.user_and_system;

import com.gg.egov.entity.Page;
import com.gg.egov.entity.User;
import com.gg.egov.service.Impl.UserServiceImpl;
import com.gg.egov.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PageQueryUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取参数
        String pageno = request.getParameter("pageno");
        Page page = new Page(pageno);

        //调用service
        UserService userService = new UserServiceImpl();
        userService.pageQueryUser(page);
        page.setTotalsize(userService.selectTotalSize());
        request.setAttribute("page",page);

        //调用view
        request.getRequestDispatcher("/system/user.jsp").forward(request,response);
    }
}
