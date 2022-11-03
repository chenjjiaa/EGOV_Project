package com.gg.egov.service;

import com.gg.egov.entity.Page;
import com.gg.egov.entity.User;

import java.util.List;

public interface UserService<T> {

    /**
     * 新增系统用户
     * @param user
     * @return
     */
    int insertUser(User user);

    /**
     * 分页查询
     * @param page
     * @return
     */
    List<T> pageQueryUser(Page<T> page);

    /**
     * 查询总记录条数
     * @return
     */
    Integer selectTotalSize();

    /**
     * 查询用户信息
     */
    User selectUserByUsercode(String usercode);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    Integer updateUser(User user);

    /**
     * 删除用户信息
     * @param usercode
     * @return
     */
    Integer deleteUser(String usercode);

}
