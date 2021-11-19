package com.like.crud.bean;

import javax.validation.constraints.Pattern;
import java.util.Date;

public class Employee {

    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]+$)",message = "用户名格式不正确")
    private String empName;

    private String gender;
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message = "邮箱格式不正确")
    private String empEmail;

    private Integer dId;

    private Department department;

    private Date create_time;

    private Integer score;



    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getCreate_time() {
        return  create_time;
    }


    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", empEmail='" + empEmail + '\'' +
                ", dId=" + dId +
                ", department=" + department +
                ", create_time=" + create_time +
                ", score=" + score +
                '}';
    }

    public Employee(Integer empId, String empName, String gender, String empEmail, Integer dId, Date create_time , Integer score) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.empEmail = empEmail;
        this.dId = dId;
    this.create_time=create_time;
        this.score = score;
    }

    public Employee() {

    }

    /**
     * 查询员工带部门的
     * @return
     */

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail == null ? null : empEmail.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}