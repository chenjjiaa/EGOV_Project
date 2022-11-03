package com.gg.egov.service.Impl;

import com.gg.egov.dao.Impl.InvestorDaoImpl;
import com.gg.egov.dao.InvestorDao;
import com.gg.egov.entity.Investor;
import com.gg.egov.entity.Page;
import com.gg.egov.service.InvestorService;
import com.gg.egov.util.DBUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InvestorServiceImpl<T> implements InvestorService {

    private InvestorDao dao = new InvestorDaoImpl();
    private List<T> invList = new ArrayList<>();
    private Integer count = 0;

    /**
     * 新增投资人
     * @param investor
     * @return 执行成功的条数
     */
    public Integer insertInvestor(Investor investor) {
        try {
            count = dao.insertInvestor(investor);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    /**
     * 分页查询投资人
     * @param page 传入分页对象
     * @return 返回一个带有分页对象的List集合
     */
    public Page<T> pageQueryInvestor(Page page, Investor investor){
        try {
            dao.pageQueryInvestor(page,investor);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return page;
    }

    /**
     * 查询投资人总记录条数
     * @return
     */
    public Integer queryTotal() {
        Integer count = 0;
        try {
            count = dao.queryTotal();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    /**
     * 根据投资人编号查询
     * @param invregnum
     * @return
     */
    public Investor queryInvestorByNum(String invregnum) {
        Investor investor = new Investor();
        try {
            investor = dao.queryInvestorByNum(invregnum);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return investor;
    }


}
