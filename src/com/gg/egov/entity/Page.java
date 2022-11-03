package com.gg.egov.entity;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {

    /**
     * 页码，从网页获取
     */
    private Integer pageno;

    /**
     * 每页显示的条数
     */
    private Integer pagesize;

    /**
     * 总条数，由查询结果获取
     */
    private Integer totalsize;

    /**
     * 装载网页数据的集合对象，可以是用户，当然也可以是投资人、企业
     */
    public List<T> dataList;



    public Page(String  pageno) {
        if (pageno != null){
            this.pageno = Integer.valueOf(pageno);
        }else {
            this.pageno = 1;
        }
        this.pagesize = 5;
        dataList = new ArrayList<>();
    }

    public Integer getPageno() {
        return pageno;
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public void setTotalsize(Integer totalsize){
        this.totalsize = totalsize;
    }

    public Integer getTotalsize() {
        return totalsize;
    }

    public Integer getPageCount(){
        return totalsize%pagesize==0 ? (totalsize/pagesize) : (totalsize/pagesize)+1 ;
    }

    public List<T> getDataList() {
        return dataList;
    }
}
