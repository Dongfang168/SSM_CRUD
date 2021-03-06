package com.like.crud.bean;

public class Department {
    private Integer dptId;

    private String dptName;

    public Department(Integer dptId, String dptName) {
        this.dptId = dptId;
        this.dptName = dptName;
    }

    public Department() {
    }

    public Integer getDptId() {
        return dptId;
    }

    public void setDptId(Integer dptId) {
        this.dptId = dptId;
    }

    public String getDptName() {
        return dptName;
    }

    public void setDptName(String dptName) {
        this.dptName = dptName == null ? null : dptName.trim();
    }
}