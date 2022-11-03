package com.gg.egov.service.Impl;

import com.gg.egov.dao.EnterpriseDao;
import com.gg.egov.dao.Impl.EnterpriseDaoImpl;
import com.gg.egov.entity.Enterprise;
import com.gg.egov.entity.Page;
import com.gg.egov.service.EnterpriseService;
import com.gg.egov.util.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EnterpriseServiceImpl implements EnterpriseService {

    Connection conn = DBUtil.getconnection();
    private EnterpriseDao enterpriseDao = new EnterpriseDaoImpl();
    private Integer count = 0;



    /**
     * 验证组织机构代码是否存在：组织机构代码不可重复
     * @param orgcode 组织机构代码
     * @return 若返回结果为 1 ，则代表组织机构代码已存在
     */
    public Integer verificaExist(String orgcode) {
        try {
            count = enterpriseDao.verificaExist(orgcode);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    /**
     * 新增企业信息，以及企业与投资人关系信息
     * @param enterprise 企业信息
     * @param invregnums 投资人编号条目组
     * @param scales 投资
     * @param regcaps
     * @return
     */
    public Integer insertEnterpriseAndInv(Enterprise enterprise, String[] invregnums, String[] regcaps, String[] scales) throws SQLException {
        try {
            DBUtil.beginTransaction(conn);
            count = enterpriseDao.insertEnterpriseAndInv(enterprise,invregnums,regcaps,scales);
            DBUtil.commitTransaction(conn);
        } catch (SQLException throwables) {
                DBUtil.rollbackTransaction(conn);
        }finally {
            DBUtil.endTransaction(conn);
            DBUtil.close(); // connection 要在 Service 中关闭
        }
        return count;
    }

    /**
     * 分页查询企业信息
     * @param page 分页对象
     * @param enterprise 带有查询条件的企业对象，但不作为List中的参数返回
     * @return 返回一个分页对象,分页对象里的List自带了全部的企业信息
     */
    public Page pageQueryEnterprise(Page page,Enterprise enterprise) {
        try {
            DBUtil.beginTransaction(conn);
            page = enterpriseDao.pageQueryEnterprise(page,enterprise);
            DBUtil.endTransaction(conn);
        } catch (SQLException throwables) {
            try {
                DBUtil.rollbackTransaction(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throwables.printStackTrace();
        }finally {
            DBUtil.close();
        }
        return page;
    }

    /**
     * 查询总条数
     * @return
     */
    public Integer queryTotal() {
        Integer count = 0;
        try {
            count = enterpriseDao.queryTotal();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }


    /**
     * 根据组织机构代码查询企业详情
     * @param orgcode 组织机构代码
     * @return 单个企业对象
     */
    public Enterprise queryEnByOrgcode(String orgcode) {
        Enterprise enterprise = new Enterprise();
        try {
            enterprise = enterpriseDao.queryEnByOrgcode(orgcode);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return enterprise;
    }
}
