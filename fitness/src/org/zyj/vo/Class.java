package org.zyj.vo;

public class Class {
    private Integer cid;

    private String cname;

    private Integer ctime;

    private Double cprice;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getCtime() {
        return ctime;
    }

    public void setCtime(Integer ctime) {
        this.ctime = ctime;
    }

    public Double getCprice() {
        return cprice;
    }

    public void setCprice(Double cprice) {
        this.cprice = cprice;
    }
}