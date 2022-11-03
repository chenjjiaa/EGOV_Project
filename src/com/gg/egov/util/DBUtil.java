package com.gg.egov.util;

import java.sql.*;

/**
 * Author：  chenjjia
 * Date：    2021/11/13 20:31
 * WeChat：  China_JoJo_
 * Blog：    https://juejin.cn/user/1856417285289304/posts
 * Github：  https://github.com/chenjjiaa
 */
public class DBUtil {

    /**
     *     final static String URL = "jdbc:mysql://localhost:3306/chen";
     *     final static String USERNAME = "root";
     *     final static String PASSWORD = "122xxxxxxx";
     *     private static Connection conn = null;
     *     private static PreparedStatement ps = null;
     *     private static ResultSet rs = null;
     */

    private static final String URL = "jdbc:mysql://localhost:3306/EGOV";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "122xxxxxxx";
    private static ThreadLocal threadLocal = new ThreadLocal(); // 优化后添加了ThreadLocal
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     */
    public static Connection getconnection() {
        conn = (Connection) threadLocal.get();
        if (conn == null){
            try {
                conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            threadLocal.set(conn);
        }
        return conn;
    }

    /**
     *获取预编译DB操作对象
     */
    public static PreparedStatement createPrepareStatement(String sql) throws SQLException {
        conn = getconnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        return ps;
    }


    /**
     * 释放资源
     */
    public static void close(){
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                /**
                 * 当前线程一定要和连接对象解除绑定关系。
                 */
                threadLocal.remove();
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
    //方法重载，三个参数时
    public static void close(ResultSet rs){
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        close();
    }

    /**
     * 开启事务
     * @throws SQLException
     */
    public static void beginTransaction(Connection conn) throws SQLException {
        if (conn != null){
            conn.setAutoCommit(false);
        }
    }

    /**
     * 结束事务
     * @throws SQLException
     */
    public static void endTransaction(Connection conn) throws SQLException {
        if (conn != null){
            conn.setAutoCommit(true);
        }
    }

    /**
     * 提交事务
     * @throws SQLException
     */
    public static void commitTransaction(Connection conn) throws SQLException {
        if (conn != null){
            conn.commit();
        }
    }

    /**
     * 回滚事务：在异常触发时回滚
     * @throws SQLException
     */
    public static void rollbackTransaction(Connection conn) throws SQLException {
        if (conn != null){
            conn.rollback();
        }
    }
}
