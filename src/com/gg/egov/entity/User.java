package com.gg.egov.entity;

public class User {

    private String usercode;
    private String username;
    private String userpswd;
    private String orgtype;
    private String regdate;

    public User() {
    }

    public User(String usercode, String username, String userpswd, String orgtype, String regdate) {
        this.usercode = usercode;
        this.username = username;
        this.userpswd = userpswd;
        this.orgtype = orgtype;
        this.regdate = regdate;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpswd() {
        return userpswd;
    }

    public void setUserpswd(String userpswd) {
        this.userpswd = userpswd;
    }

    public String getOrgtype() {
        return orgtype;
    }

    public void setOrgtype(String orgtype) {
        this.orgtype = orgtype;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
}
