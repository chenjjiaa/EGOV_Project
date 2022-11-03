package com.gg.egov.controller.user_and_system;

import com.gg.egov.entity.User;
import com.gg.egov.service.Impl.UserServiceImpl;
import com.gg.egov.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SelectUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GB18030");
        //获取数据
        String usercode = request.getParameter("usercode");
        String pageno = request.getParameter("pageno");

        //调用Modle
        UserService userService = new UserServiceImpl();
        User user = userService.selectUserByUsercode(usercode);

        //调用View
        request.setAttribute("user",user);
        request.setAttribute("pageno",pageno);
        request.getRequestDispatcher("/system/userUpdate.jsp").forward(request,response);

    }
}
