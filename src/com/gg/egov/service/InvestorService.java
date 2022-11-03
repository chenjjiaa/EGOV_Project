package com.gg.egov.service;

import com.gg.egov.entity.Investor;
import com.gg.egov.entity.Page;

import java.util.List;

public interface InvestorService<T> {

    /**
     * 新增投资人
     * @param investor
     * @return 执行成功的条数
     */
    Integer insertInvestor(Investor investor);

    /**
     * 分页查询投资人
     * @param page 传入分页对象
     * @return 返回一个带有分页对象的List集合
     */
    Page<T> pageQueryInvestor(Page<T> page,Investor investor);

    /**
     * 查询总条数
     * @return
     */
    Integer queryTotal();

    /**
     * 根据投资人编号查询
     * @param invregnum 编号
     * @return 返回一个投资人详情
     */
    Investor queryInvestorByNum(String invregnum);
}
