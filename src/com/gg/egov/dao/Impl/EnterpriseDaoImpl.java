package com.gg.egov.dao.Impl;

import com.gg.egov.dao.EnterpriseDao;
import com.gg.egov.entity.Enterprise;
import com.gg.egov.entity.Page;
import com.gg.egov.util.DBUtil;
import com.gg.egov.util.ThreadLocal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EnterpriseDaoImpl implements EnterpriseDao {


    private Integer count = 0;
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;


    /**
     * 验证组织机构代码是否存在：组织机构代码不可重复
     * @param orgcode 组织机构代码
     * @return 若返回结果为 1 ，则代表组织机构代码已存在
     */
    public Integer verificaExist(String orgcode) throws SQLException {
        String sql = "select orgcode from t_enterprise where orgcode=?";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,orgcode);
        rs = ps.executeQuery();
        while (rs.next()){
            ++count;
        }
        DBUtil.close(rs);
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
        String sql = "insert into t_enterprise(orgcode,regno,cnname,enname,contactman,contacttel,regcap,outregcap,regcry,usercode,regdate) values(?,?,?,?,?,?,?,?,?,?,?)";

        ps = DBUtil.createPrepareStatement(sql);

        ps.setString(1,enterprise.getOrgcode());
        ps.setString(2,enterprise.getRegno());
        ps.setString(3,enterprise.getCnname());
        ps.setString(4,enterprise.getEnname());
        ps.setString(5,enterprise.getContactman());
        ps.setString(6,enterprise.getContacttel());
        ps.setInt(7,Integer.valueOf(enterprise.getRegcap()));
        ps.setInt(8,Integer.valueOf(enterprise.getOutregcap()));
        ps.setString(9,enterprise.getRegcry());
        ps.setString(10,enterprise.getUsercode());
        ps.setString(11,enterprise.getRegdate());
        count = ps.executeUpdate();

        sql = "insert into t_en_inv(orgcode,invregnum,regcap,scale) values(?,?,?,?)";
        ps = DBUtil.createPrepareStatement(sql);
        for (int i=0; i<invregnums.length; i++){
            ps.setString(1,enterprise.getOrgcode());
            ps.setString(2,invregnums[i]);
            ps.setString(3,regcaps[i]);
            ps.setString(4,scales[i]);
            count += ps.executeUpdate();
        }
        return count;
    }

    /**
     * 分页查询企业信息
     * @param page 分页对象
     * @param enterprise 带有查询条件的企业对象，但不作为List中的参数返回
     * @return 返回一个分页对象,分页对象里的List自带了全部的企业信息
     */
    public Page pageQueryEnterprise(Page page,Enterprise enterprise) throws SQLException {
        List pageList = page.getDataList();
        List<String> paramList = new ArrayList();
        StringBuilder sql = new StringBuilder("select e.orgcode,e.cnname,e.regdate,u.username from t_enterprise e join t_user u on e.usercode=u.usercode where 1=1");

        //动态条件查询
        if (enterprise.getOrgcode() != null && enterprise.getOrgcode() != ""){
            sql.append( " and e.orgcode=?");
            paramList.add(enterprise.getOrgcode());
        }
        if (enterprise.getCnname() != null && enterprise.getCnname() != ""){
            sql.append(" and e.cnname like ? ");
            paramList.add("%" + enterprise.getCnname() + "%");
        }
        if (enterprise.getStartdate() != null && enterprise.getStartdate() != ""){
            sql.append(" and e.regdate>=?");
            paramList.add(enterprise.getStartdate());

        }
        if (enterprise.getEnddate() != null && enterprise.getEnddate() != ""){
            sql.append(" and e.regdate<=?");
            paramList.add(enterprise.getEnddate());
        }

        //分页语句
        sql.append(" limit " + (page.getPageno()-1) * page.getPagesize() + "," + page.getPagesize());

        //预编译
        ps = DBUtil.createPrepareStatement(sql.toString());

        //动态赋值
        for (int i=0; i<paramList.size(); i++){
            ps.setString(i+1,paramList.get(i));
        }

        rs = ps.executeQuery();

        while (rs.next()){
            Enterprise en = new Enterprise();
            en.setOrgcode(rs.getString("orgcode"));
            en.setCnname(rs.getString("cnname"));
            en.setRegdate(rs.getString("regdate"));
            en.setUsername(rs.getString("username"));
            pageList.add(en);
        }
        return page;
    }

    /**
     * 查询总条数
     * @return
     */
    public Integer queryTotal() throws SQLException {
        Integer count = 0;
        String sql = "select count(*) as totalsize from t_enterprise";
        ps = DBUtil.createPrepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()){
            count = Integer.valueOf(rs.getString("totalsize"));
        }
        DBUtil.close(rs);
        return count;
    }

    /**
     * 根据组织机构代码查询企业详情
     * @param orgcode 组织机构代码
     * @return 单个企业对象
     */
    public Enterprise queryEnByOrgcode(String orgcode) throws SQLException {
        Enterprise enterprise = new Enterprise();
        String sql = "select cnname,regcry,regcap from t_enterprise where orgcode=?";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,orgcode);
        rs = ps.executeQuery();
        while (rs.next()){
            enterprise.setCnname(rs.getString("cnname"));
            enterprise.setRegcry(rs.getString("regcry"));
            enterprise.setRegcap(rs.getString("regcap"));
        }
        return enterprise;
    }
}















