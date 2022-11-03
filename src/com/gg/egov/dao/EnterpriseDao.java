package com.gg.egov.dao;

import com.gg.egov.entity.Enterprise;
import com.gg.egov.entity.Page;
import com.gg.egov.util.ThreadLocal;

import java.sql.SQLException;
import java.util.List;

public interface EnterpriseDao<T> {

    /**
     * 验证组织机构代码是否存在：组织机构代码不可重复
     * @param orgcode 组织机构代码
     * @return 若返回结果为 1 ，则代表组织机构代码已存在
     */
    Integer verificaExist(String orgcode) throws SQLException;

    /**
     * 新增企业信息，以及企业与投资人关系信息
     * @param enterprise 企业信息
     * @param invregnums 投资人编号条目组
     * @param scales 投资
     * @param regcaps
     * @return
     */
    Integer insertEnterpriseAndInv(Enterprise enterprise, String[] invregnums, String[] regcaps, String[] scales) throws SQLException;

    /**
     * 分页查询企业信息
     * @param page 分页对象
     * @param enterprise 带有查询条件的企业对象，但不作为List中的参数返回
     * @return 返回一个分页对象,分页对象里的List自带了全部的企业信息
     */
    Page<T> pageQueryEnterprise (Page page,Enterprise enterprise) throws SQLException;

    /**
     * 查询总条数
     * @return
     */
    Integer queryTotal() throws SQLException;

    /**
     * 根据组织机构代码查询企业详情
     * @param orgcode 组织机构代码
     * @return 单个企业对象
     */
    Enterprise queryEnByOrgcode(String orgcode) throws SQLException;
}
