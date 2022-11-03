package com.gg.egov.util;

import java.util.HashMap;
import java.util.Map;

/**
 * ThreadLocal 作用是让事务跨 Dao、service 层获取连接对象
 * 因为在 service 层中控制事务，必须保证 service 方法执行的连接对象和 dao 方法中的 Connection 是同一个
 * Author：  chenjunjia
 * Date：    2021/11/13 18:37
 * WeChat：  China_JoJo_
 */
public class ThreadLocal<T> {

    Map<Thread,T> threadLocalMap = new HashMap();

    public void set(T obj){
        threadLocalMap.put(Thread.currentThread(),obj);
    }

    public T get(){
        return threadLocalMap.get(Thread.currentThread());
    }

    public void remove(){
        threadLocalMap.remove(Thread.currentThread());
    }
}
