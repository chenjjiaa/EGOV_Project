package com.gg.egov.service.Impl;
import com.gg.egov.dao.Impl.UserDaoImpl;
import com.gg.egov.dao.UserDao;
import com.gg.egov.entity.Page;
import com.gg.egov.entity.User;
import com.gg.egov.service.UserService;
import com.gg.egov.util.DBUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserServiceImpl<T> implements UserService {

    UserDao userDao = new UserDaoImpl();
    User user = null;
    int count = 0;

    /**
     * 新增用户
     * @param user
     * @return count
     */
    public int insertUser(User user) {
        int count = 0;
        try {
            count = userDao.insertUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    /**
     * 分页查询用户
     */
    public List<T> pageQueryUser(Page page){
        List userList = new ArrayList();
        try {
            userList = userDao.pageQueryUser(page);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    /**
     * 查询总条数
     * @return
     */
    public Integer selectTotalSize(){
        Integer count = 0;
        try {
            count = userDao.selectTotalSize();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    /**
     * 根据用户代码查询用户信息
     * @param usercode
     * @return
     */
    public User selectUserByUsercode(String usercode) {
        try {
            user = userDao.selectUserByUsercode(usercode);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    public Integer updateUser(User user) {
        try {
            count = userDao.updateUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

    /**
     * 批量删除用户信息
     * @param usercode
     * @return
     */
    public Integer deleteUser(String usercode) {
        try {
            userDao.deleteUser(usercode);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count;
    }

}
