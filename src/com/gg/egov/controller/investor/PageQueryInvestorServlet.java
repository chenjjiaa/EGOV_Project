package com.gg.egov.controller.investor;

import com.gg.egov.entity.Investor;
import com.gg.egov.entity.Page;
import com.gg.egov.service.Impl.InvestorServiceImpl;
import com.gg.egov.service.InvestorService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PageQueryInvestorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String goPage = request.getParameter("goPage");

        String invregnum = request.getParameter("invregnum");
        String invname = request.getParameter("invname");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String pageno = request.getParameter("pageno");
        Page<Investor> page = new Page<>(pageno);
        Investor investor = new Investor();
        investor.setInvregnum(invregnum);
        investor.setInvname(invname);
        investor.setStartdate(startdate);
        investor.setEnddate(enddate);

        InvestorService investorService = new InvestorServiceImpl();
        page = investorService.pageQueryInvestor(page,investor);
        page.setTotalsize(investorService.queryTotal());

        if (page != null){
            request.setAttribute("page",page);
            request.setAttribute("investor",investor);

            if (goPage.equals("1")){
                request.getRequestDispatcher("/basicinfo/exoticOrgList.jsp").forward(request,response);
                return;
            }
            if (goPage.equals("2")){
                request.getRequestDispatcher("/foreignExchange/orgcodeSelect.jsp").forward(request,response);
            }

        }

    }

}
