package com.gg.egov.controller.user_and_system;

import com.gg.egov.service.Impl.UserServiceImpl;
import com.gg.egov.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GB18030");
        String[] usercodes = request.getParameterValues("usercode");
        Integer count = 0;
        UserService userService = new UserServiceImpl();
        for (String usercode:usercodes){
            userService.deleteUser(usercode);
            count++;
        }
        if (count == usercodes.length){
            response.sendRedirect("/EGOV/servlet/PageQueryUser");
        }

    }
}
