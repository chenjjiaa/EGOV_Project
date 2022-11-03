package com.gg.egov.controller.investor;

import com.gg.egov.entity.Investor;
import com.gg.egov.service.Impl.InvestorServiceImpl;
import com.gg.egov.service.InvestorService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ShowInfomationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Investor investor = null;
        String invregnum = request.getParameter("invregnum");

        InvestorService investorService = new InvestorServiceImpl();
        investor = investorService.queryInvestorByNum(invregnum);

        if (investor != null){
            request.setAttribute("investor",investor);
            request.getRequestDispatcher("/basicinfo/exoticOrgView.jsp").forward(request,response);
        }
    }
}
