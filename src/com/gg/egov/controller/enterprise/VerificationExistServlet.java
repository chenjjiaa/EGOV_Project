package com.gg.egov.controller.enterprise;

import com.gg.egov.service.EnterpriseService;
import com.gg.egov.service.Impl.EnterpriseServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class VerificationExistServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orgcode = request.getParameter("orgcode");
        EnterpriseService enterpriseService = null;
        enterpriseService = new EnterpriseServiceImpl();

        Integer count = enterpriseService.verificaExist(orgcode);

        if (orgcode.equals("")){
            request.setAttribute("errorMsg","组织机构代码不能为空，请填写！！");
            request.getRequestDispatcher("/foreignExchange/newInputOrg.jsp").forward(request,response);
            return;
        }
        if (count == 1){
            request.setAttribute("errorMsg","该组织机构代码已存在，请重新填写");
            request.getRequestDispatcher("/foreignExchange/newInputOrg.jsp").forward(request,response);
            return;
        }else {
            request.getRequestDispatcher("/foreignExchange/inputOrgInfo.jsp").forward(request,response);
            return;
        }
    }
}
