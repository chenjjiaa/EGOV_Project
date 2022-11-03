package com.gg.egov.controller.inv_and_en;

import com.gg.egov.entity.Enterprise;
import com.gg.egov.entity.User;
import com.gg.egov.service.EnterpriseService;
import com.gg.egov.service.Impl.EnterpriseServiceImpl;
import com.gg.egov.util.Const;
import com.gg.egov.util.DateUtil;
import com.gg.egov.util.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

public class SaveInvAndEnServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        Integer count = 0;
        //企业信息
        Enterprise enterprise = new Enterprise();
        enterprise = (Enterprise) WebUtil.makeRequestToObject(request,enterprise);
        enterprise.setUsercode(((User)request.getSession(false).getAttribute("user")).getUsercode());
        enterprise.setRegdate(DateUtil.format(Const.DATE_FORMATE_YMD,new Date()));
        //关联表信息详情
        String[] invregnums = request.getParameterValues("invregnum");
        String[] regcaps = request.getParameterValues("regcapItem");
        String[] scales = request.getParameterValues("scale");

        //service
        try {
            EnterpriseService enterpriseService = new EnterpriseServiceImpl();
            count = enterpriseService.insertEnterpriseAndInv(enterprise,invregnums,regcaps,scales);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        //view
        if (count == (invregnums.length+1)){
            request.setAttribute("successMsg","指挥官大人，企业信息添加成功了唷！");
            request.getRequestDispatcher("../foreignExchange/inputOrgInfo.jsp").forward(request,response);
        }else {
            request.setAttribute("errorMsg","糟糕！企业信息添加成功了呜！");
            request.getRequestDispatcher("../foreignExchange/inputOrgInfo.jsp").forward(request,response);
        }

    }

}