package org.zyj.vo;

public class PaycostKey {
    private Integer pid;

    private String recordpeople;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getRecordpeople() {
        return recordpeople;
    }

    public void setRecordpeople(String recordpeople) {
        this.recordpeople = recordpeople == null ? null : recordpeople.trim();
    }
}