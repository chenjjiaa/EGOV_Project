package com.gg.egov.controller.auth;

import com.gg.egov.entity.Enterprise;
import com.gg.egov.service.EnterpriseService;
import com.gg.egov.service.Impl.EnterpriseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ShowEnterpriseMsgServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orgcode = request.getParameter("orgcode");

        EnterpriseService enterpriseService = new EnterpriseServiceImpl();
        Enterprise enterprise = enterpriseService.queryEnByOrgcode(orgcode);
        enterprise.setOrgcode(orgcode);

        if (enterprise != null){
            request.setAttribute("enterprise",enterprise);
            request.getRequestDispatcher("/auth/openAccountAuthDetail.jsp").forward(request,response);
        }
    }
}
