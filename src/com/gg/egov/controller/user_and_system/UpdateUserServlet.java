package com.gg.egov.controller.user_and_system;

import com.gg.egov.entity.User;
import com.gg.egov.service.Impl.UserServiceImpl;
import com.gg.egov.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Integer count = 0;
        //获取数据
        String pageno = request.getParameter("pageno");
        String usercode = request.getParameter("usercode");
        String username = request.getParameter("username");
        String userpswd = request.getParameter("userpswd");
        String orgtype = request.getParameter("orgtype");
        User user = new User(usercode,username,userpswd,orgtype,null);
//        user.setUsercode(usercode);
//        user.setUsercode(username);
//        user.setUsercode(userpswd);
//        user.setUsercode(orgtype);

        //调用M
        UserService userService = new UserServiceImpl();
        count = userService.updateUser(user);

        //调用V
        if (count == 1){
            response.sendRedirect("/EGOV/servlet/PageQueryUser?pageno=" + pageno);
        }
    }
}
