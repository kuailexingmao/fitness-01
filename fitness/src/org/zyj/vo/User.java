package org.zyj.vo;

import java.util.Date;

public class User {
    private Integer uid;

    private String uname;

    private String sex;

    private String certifyno;

    private String tel;

    private String address;

    private String email;

    private Date opentime;

    private String isvip;

    private Date lastupdatetime;

    private String vipcardid;

    private Date viptime;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getCertifyno() {
        return certifyno;
    }

    public void setCertifyno(String certifyno) {
        this.certifyno = certifyno == null ? null : certifyno.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getOpentime() {
        return opentime;
    }

    public void setOpentime(Date opentime) {
        this.opentime = opentime;
    }

    public String getIsvip() {
        return isvip;
    }

    public void setIsvip(String isvip) {
        this.isvip = isvip == null ? null : isvip.trim();
    }

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

    public String getVipcardid() {
        return vipcardid;
    }

    public void setVipcardid(String vipcardid) {
        this.vipcardid = vipcardid == null ? null : vipcardid.trim();
    }

    public Date getViptime() {
        return viptime;
    }

    public void setViptime(Date viptime) {
        this.viptime = viptime;
    }
}