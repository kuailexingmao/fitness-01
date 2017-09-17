package org.zyj.vo;

import java.util.Date;

public class Paycost extends PaycostKey {
    private String pname;

    private String ptel;

    private String certifyno;

    private Date paytime;

    private Double payaccount;

    private String note;

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getPtel() {
        return ptel;
    }

    public void setPtel(String ptel) {
        this.ptel = ptel == null ? null : ptel.trim();
    }

    public String getCertifyno() {
        return certifyno;
    }

    public void setCertifyno(String certifyno) {
        this.certifyno = certifyno == null ? null : certifyno.trim();
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public Double getPayaccount() {
        return payaccount;
    }

    public void setPayaccount(Double payaccount) {
        this.payaccount = payaccount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}