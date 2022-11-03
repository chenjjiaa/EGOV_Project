package com.gg.egov.dao;

import com.gg.egov.entity.Page;
import com.gg.egov.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao<T> {

    /**
     * 新增系统用户
     * @param user
     * @return 返回一个查询结果执行条数
     * @throws SQLException
     */
    int insertUser(User user) throws SQLException;

    /**
     * 分页查询系统用户
     * @param page
     * @return 返回一个User集合
     * @throws SQLException
     */
    List<T> pageQueryUser(Page page) throws SQLException;

    /**
     * 查询总记录条数
     * @return 返回总记录条数总数
     * @throws SQLException
     */
    Integer selectTotalSize() throws SQLException;

    /**
     * 查询用户信息
     */
    User selectUserByUsercode(String usercode) throws SQLException;

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    Integer updateUser(User user) throws SQLException;

    /**
     * 删除用户信息
     * @param usercode
     * @return
     */
    Integer deleteUser(String usercode) throws SQLException;

    /**
     * 用户登陆
     * @param usercode
     * @param userpswd
     * @param orgtype
     * @return
     */
    Integer login(String usercode,String userpswd, String orgtype);
}
