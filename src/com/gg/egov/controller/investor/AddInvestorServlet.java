package com.gg.egov.controller.investor;

import com.gg.egov.entity.Investor;
import com.gg.egov.entity.User;
import com.gg.egov.service.Impl.InvestorServiceImpl;
import com.gg.egov.service.InvestorService;
import com.gg.egov.util.Const;
import com.gg.egov.util.DateUtil;
import com.gg.egov.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

public class AddInvestorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        Integer count = 0;
        String invname = request.getParameter("invname");
        String cty = request.getParameter("cty");
        String orgcode = request.getParameter("orgcode");
        String contactman = request.getParameter("contactman");
        String contacttel = request.getParameter("contacttel");
        String email = request.getParameter("email");
        String remark = request.getParameter("remark");
        String usercode = ((User) request.getSession().getAttribute("user")).getUsercode();
        String regdate = DateUtil.format(Const.DATE_FORMATE_YMD,new Date());
        Investor inv = new Investor(null,invname,cty,orgcode,contactman,contacttel,email,remark,usercode,regdate);

        InvestorService investorService = new InvestorServiceImpl();
        count = investorService.insertInvestor(inv);

        if (count != null && count == 1){
            request.setAttribute("successMsg","指挥官大人，新增投资人成功！");
            request.getRequestDispatcher("/basicinfo/exoticOrgAdd.jsp").forward(request,response);
        }else {
            request.setAttribute("errorMsg","糟糕！新增投资人失败啦，请重试！");
            //因为表单提交到这里/EGOV/AddInvestor， 所以当前路径是xxxx:8080/EGOV/
            //所以接下来定位剩下的资源文件即可
            request.getRequestDispatcher("/basicinfo/exoticOrgAdd.jsp").forward(request,response);
        }
    }
}
