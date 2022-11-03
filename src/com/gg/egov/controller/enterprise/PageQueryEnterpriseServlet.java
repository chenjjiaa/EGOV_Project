package com.gg.egov.controller.enterprise;

import com.gg.egov.entity.Enterprise;
import com.gg.egov.entity.Page;
import com.gg.egov.service.EnterpriseService;
import com.gg.egov.service.Impl.EnterpriseServiceImpl;
import com.gg.egov.util.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PageQueryEnterpriseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pageno = request.getParameter("pageno");
        Enterprise enterprise = new Enterprise();
        enterprise = (Enterprise) WebUtil.makeRequestToObject(request,enterprise);
        Page page = new Page(pageno);

        EnterpriseService enterpriseService = new EnterpriseServiceImpl();
        page = enterpriseService.pageQueryEnterprise(page,enterprise);
        Integer totalSize = enterpriseService.queryTotal();
        page.setTotalsize(totalSize);

        if (page != null){
            request.setAttribute("page",page);
            request.setAttribute("enterprise",enterprise);
            request.getRequestDispatcher("/auth/orgcodeSelect.jsp").forward(request,response);
        }

    }

}
