package com.like.crud.service;

import com.like.crud.bean.Department;
import com.like.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-11-15 23:08
 */
@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepte() {

        List<Department> list = departmentMapper.selectByExample(null);

        return list;
    }
}
