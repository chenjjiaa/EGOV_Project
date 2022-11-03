package com.gg.egov.controller.user_and_system;

import com.gg.egov.entity.User;
import com.gg.egov.service.Impl.UserServiceImpl;
import com.gg.egov.service.UserService;
import com.gg.egov.util.Const;
import com.gg.egov.util.DateUtil;
import com.gg.egov.util.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class InsertUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("GB18030");//后期用Filter来处理，AOP编程

        /*//接收数据
        String usercode = request.getParameter("usercode");
        String username = request.getParameter("username");
        String userpswd = request.getParameter("userpswd");
        String orgtype = request.getParameter("orgtype");
        //登记日期
        String regdate = DateUtil.format(Const.DATE_FORMATE_ALL, new Date());
        //封装User对象
        User user = new User();
        user.setUsercode(usercode);
        user.setUsername(username);
        user.setUserpswd(userpswd);
        user.setOrgtype(orgtype);
        user.setRegdate(regdate);*/

        User user = new User();
        user = (User) WebUtil.makeRequestToObject(request,user);
        //登记日期
        String regdate = DateUtil.format(Const.DATE_FORMATE_ALL, new Date());
        user.setRegdate(regdate);

        //调用Model
        int count = 0;
        UserService userService = new UserServiceImpl();
        count = userService.insertUser(user);

        //调用View
        request.setAttribute("user",user);
        if (count == 1) {
            response.sendRedirect("/EGOV/servlet/PageQueryUser");
            /*request.setAttribute("successMsg","耶耶耶！新增用户成功了！");
            request.getRequestDispatcher("/servlet/PageQueryUser").forward(request,response);*/
            return;
        } /*else {
            request.setAttribute("failedMsg","呜呜呜，新增用户失败了……");
            request.getRequestDispatcher("/servlet/PageQueryUser").forward(request,response);
            return;
        }*/

    }

}
