package com.gg.egov.controller.user_and_system;

import com.gg.egov.dao.Impl.UserDaoImpl;
import com.gg.egov.dao.UserDao;
import com.gg.egov.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GB18030");
        String usercode = request.getParameter("usercode");
        String userpswd = request.getParameter("userpswd");
        String orgtype = request.getParameter("orgtype");
        Integer count = 0;
        UserDao userDao = new UserDaoImpl();
        User user = new User();
        count = userDao.login(usercode,userpswd,orgtype);
        try {
            user = userDao.selectUserByUsercode(usercode);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (count == 1){
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            response.sendRedirect("/EGOV/main.html");
        }else {
            response.sendRedirect("/EGOV/loginError.jsp");
        }
    }
}
