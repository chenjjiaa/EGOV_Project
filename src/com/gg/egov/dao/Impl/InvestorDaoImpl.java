package com.gg.egov.dao.Impl;

import com.gg.egov.dao.InvestorDao;
import com.gg.egov.entity.Investor;
import com.gg.egov.entity.Page;
import com.gg.egov.util.DBUtil;
import com.gg.egov.util.StringUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InvestorDaoImpl<T> implements InvestorDao {

        private Integer count = 0;
        private Connection conn = null;
        private PreparedStatement ps = null;
        private ResultSet rs = null;

    /**
     * 新增投资人
     * @param investor
     * @return 执行成功的条数
     */
    public Integer insertInvestor(Investor investor) throws SQLException {
        String sql = "insert into t_invest(invname,cty,orgcode,contactman,contacttel,email,remark,usercode,regdate) values(?,?,?,?,?,?,?,?,?);";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,investor.getInvname());
        ps.setString(2,investor.getCty());
        ps.setString(3,investor.getOrgcode());
        ps.setString(4,investor.getContactman());
        ps.setString(5,investor.getContacttel());
        ps.setString(6,investor.getEmail());
        ps.setString(7,investor.getRemark());
        ps.setString(8,investor.getUsercode());
        ps.setString(9,investor.getRegdate());
        count = ps.executeUpdate();
        DBUtil.close();
        return count;
    }

    /**
     * 分页查询投资人
     * @param page 传入分页对象
     * @return 返回一个带有分页对象的List集合
     */
    public Page<T> pageQueryInvestor(Page page, Investor investor) throws SQLException {
        StringBuilder sql = new StringBuilder("select i.invregnum,i.invname,i.regdate,i.cty,u.username from t_invest i join t_user u on i.usercode=u.usercode where 1=1");

        //动态给 ps 赋值的 List（重点 重点 重点 重点 重点 重点 ！！！！）
        List<String> paramList = new ArrayList();

        //判断条件（重点 重点 重点 重点 重点 重点 ！！！！）
        if (StringUtil.isNotEmpty(investor.getInvregnum())){
            sql.append( " and i.invregnum=? ");
            paramList.add(investor.getInvregnum());
        }
        if (StringUtil.isNotEmpty(investor.getInvname())){
            /*【模糊查询要这样子做】*/
            sql.append( " and i.invname like ? ");
            paramList.add("%"+investor.getInvname()+"%");
        }
        if (StringUtil.isNotEmpty(investor.getStartdate())){
            sql.append( " and i.regdate>=? ");
            paramList.add(investor.getStartdate());
        }
        if (StringUtil.isNotEmpty(investor.getEnddate())){
            sql.append( " and i.regdate<=? ");
            paramList.add(investor.getEnddate());
        }

        sql.append(" limit " + (page.getPageno()-1) * page.getPagesize() + "," + page.getPagesize());
        ps = DBUtil.createPrepareStatement(sql.toString());

        //循环赋值
        for (int i = 0; i < paramList.size(); i++){
            //这里用 i+1 ，不能用 i++ ，要不然数组下标会越界
            ps.setString(i+1, paramList.get(i));
        }

        rs = ps.executeQuery();
        while (rs.next()){
            Investor inv = new Investor();
            inv.setInvregnum(rs.getString("invregnum"));
            inv.setInvname(rs.getString("invname"));
            inv.setRegdate(rs.getString("regdate"));
            inv.setCty(rs.getString("cty"));
            inv.setUsername(rs.getString("username"));
            page.getDataList().add(inv);
        }
        DBUtil.close(rs);
        return page;
    }

    /**
     * 查询投资人总记录条数
     * @return
     */
    public Integer queryTotal() throws SQLException {
        Integer count = 0;
        String sql = "select count(*) as totalsize from t_invest;";
        ps = DBUtil.createPrepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()){
            count = Integer.valueOf(rs.getString("totalsize"));
        }
        DBUtil.close(rs);
        return count;
    }

    /**
     * 根据投资人编号查询
     * @param invregnum
     * @return
     */
    public Investor queryInvestorByNum(String invregnum) throws SQLException {
        Investor investor = new Investor();
        String sql = "select invname,cty,orgcode,contactman,contacttel,email,remark from t_invest where invregnum=?";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,invregnum);
        rs = ps.executeQuery();
        while (rs.next()){
            investor.setInvname(rs.getString("invname"));
            investor.setCty(rs.getString("cty"));
            investor.setOrgcode(rs.getString("orgcode"));
            investor.setContactman(rs.getString("contactman"));
            investor.setContacttel(rs.getString("contacttel"));
            investor.setEmail(rs.getString("email"));
            investor.setRemark(rs.getString("remark"));
        }
        DBUtil.close(rs);
        return investor;
    }

}
