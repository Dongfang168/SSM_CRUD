package com.like.crud.controller;

import com.like.crud.bean.Department;
import com.like.crud.bean.Msg;
import com.like.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-11-15 23:06
 */
@Controller
public class departmentConrtoller {

    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list = departmentService.getDepte();
        return Msg.sucess().add("dept",list);
    }



}
