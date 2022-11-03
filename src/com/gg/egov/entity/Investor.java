package com.gg.egov.entity;

public class Investor {

    /**
     * 投资人编号
     */
    private String invregnum;

    /**
     * 投资人名称
     */
    private String invname;

    /**
     * 所属国家/地区
     */
    private String cty;

    /**
     * 组织机构代码
     */
    private String orgcode;

    /**
     * 联系人
     */
    private String contactman;

    /**
     * 联系电话
     */
    private String contacttel;

    /**
     * 电子信箱
     */
    private String email;

    /**
     * 备注
     */
    private String remark;

    /**
     * 经办人编号
     */
    private String usercode;

    /**
     * 登记日期
     */
    private String regdate;

    /**
     * 经办人
     */
    private String username;

    /**
     * 开始日期
     */
    private String startdate;

    /**
     * 结束日期
     */
    private String enddate;


    public Investor() {
    }

    public Investor(String invregnum, String invname, String cty, String orgcode, String contactman, String contacttel, String email, String remark, String usercode, String regdate) {
        this.invregnum = invregnum;
        this.invname = invname;
        this.cty = cty;
        this.orgcode = orgcode;
        this.contactman = contactman;
        this.contacttel = contacttel;
        this.email = email;
        this.remark = remark;
        this.usercode = usercode;
        this.regdate = regdate;
    }

    public String getInvregnum() {
        return invregnum;
    }

    public void setInvregnum(String invregnum) {
        this.invregnum = invregnum;
    }

    public String getInvname() {
        return invname;
    }

    public void setInvname(String invname) {
        this.invname = invname;
    }

    public String getCty() {
        return cty;
    }

    public void setCty(String cty) {
        this.cty = cty;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getContactman() {
        return contactman;
    }

    public void setContactman(String contactman) {
        this.contactman = contactman;
    }

    public String getContacttel() {
        return contacttel;
    }

    public void setContacttel(String contacttel) {
        this.contacttel = contacttel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
}