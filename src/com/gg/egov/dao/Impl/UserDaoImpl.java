package com.gg.egov.dao.Impl;
import com.gg.egov.dao.UserDao;
import com.gg.egov.entity.Page;
import com.gg.egov.entity.User;
import com.gg.egov.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl<T> implements UserDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    User user1 = new User();
    int count = 0;

    public int insertUser(User user) throws SQLException {
        int count = 0;
        String sql = "insert into t_user values(?,?,?,?,?)";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,user.getUsercode());
        ps.setString(2,user.getUsername());
        ps.setString(3,user.getUserpswd());
        ps.setString(4,user.getOrgtype());
        ps.setString(5,user.getRegdate());
        count = ps.executeUpdate();

        DBUtil.close();
        return count;
    }


    /**
     * 1,0-3
     * 2,3-3
     * 3,6-3
     * 分页查询用户
     * 返回一个带有User的List集合
     */
    public List<T> pageQueryUser(Page page) throws SQLException {

        List userList = page.getDataList();
        int pageno = page.getPageno();
        int currentIndex = (pageno-1) * page.getPagesize();
        String sql = "select usercode,username,orgtype,regdate from t_user order by regdate desc limit ?,?;";
//        String sql = "select usercode,username,orgtype,regdate from t_user order by regdate desc;";

        ps = DBUtil.createPrepareStatement(sql);
        ps.setInt(1,currentIndex);
        ps.setInt(2,page.getPagesize());
        rs = ps.executeQuery();

        //刚刚用了if导致只取得一个数据
        while (rs.next()){
            User user = new User();
            user.setUsercode(rs.getString("usercode"));
            user.setUsername(rs.getString("username"));
            user.setOrgtype(rs.getString("orgtype"));
            user.setRegdate(rs.getString("regdate"));

            //刚刚没有装载到Page对象的集合中导致外面没数据
            userList.add(user);
        }
        DBUtil.close(rs);
        return userList;
    }

    /**
     * 查询总条数
     */
    public Integer selectTotalSize() throws SQLException {
        String countString = null;
        Integer count = 0;
        String sql = "select count(*) as totalsize from t_user;";
        ps = DBUtil.createPrepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()){
            countString = rs.getString("totalsize");
            count = Integer.valueOf(countString);
        }
        DBUtil.close(rs);
        return count;
    }

    /**
     * 根据用户代码查询用户信息
     * @return 返回一个User的集合
     */
    public User selectUserByUsercode(String usercode) throws SQLException {
        String sql = "select usercode,username,userpswd,orgtype,regdate from t_user where usercode=?";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,usercode);
        rs = ps.executeQuery();
        while (rs.next()){
            user1.setUsercode(usercode);
            user1.setUsername(rs.getString("username"));
            user1.setUserpswd(rs.getString("userpswd"));
            user1.setOrgtype(rs.getString("orgtype"));
            user1.setRegdate(rs.getString("regdate"));
        }
        DBUtil.close(rs);
        return user1;
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    public Integer updateUser(User user) throws SQLException {
        String sql = "update t_user set username=? , userpswd=? , orgtype=? where usercode=?";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,user.getUsername());
        ps.setString(2,user.getUserpswd());
        ps.setString(3,user.getOrgtype());
        ps.setString(4,user.getUsercode());
        count = ps.executeUpdate();
        return count;
    }

    /**
     * 批量删除用户信息
     * @param usercode
     * @return
     */
    public Integer deleteUser(String usercode) throws SQLException {
        String sql = "delete from t_user where usercode = ?";
        ps = DBUtil.createPrepareStatement(sql);
        ps.setString(1,usercode);
        count = ps.executeUpdate();
        return count;
    }

    /**
     * 用户登陆
     * @param usercode
     * @param userpswd
     * @param orgtype
     * @return
     */
    public Integer login(String usercode, String userpswd, String orgtype) {
        String sql = "select count(*) from t_user where usercode=? and userpswd=? and orgtype=?";
        int count = 0;
        try {
            ps = DBUtil.createPrepareStatement(sql);
            ps.setString(1,usercode);
            ps.setString(2,userpswd);
            ps.setString(3,orgtype);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt("count(*)");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            DBUtil.close(rs);
        }
        return count;
    }
}
