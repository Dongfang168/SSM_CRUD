package com.like.crud.service;

import com.like.crud.bean.Employee;
import com.like.crud.bean.EmployeeExample;
import com.like.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author shkstart
 * @create 2021-11-13 22:36
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     * @return
     */
    public List<Employee> getAll() {
//        EmployeeExample example = new EmployeeExample();

        return employeeMapper.selectByExampleWithDpt(null);
    }
    public List<Employee> getAllOrder(String sortField,String sortType){

        System.out.println(sortField + "," + sortType );

        String cause = "CREATE_TIME desc";
        if(!StringUtils.isEmpty(sortField)){
            cause = sortField+" " ;
        }
        if(!StringUtils.isEmpty(sortType)){
            cause += sortType;
        }else{
            cause += " desc";
        }
        EmployeeExample example = new EmployeeExample();

        example.setCause(cause);

        return employeeMapper.selectOrderby(example);
    }

    /**
     * 保存员工
     * @param employee
     */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public Boolean checkUser(String empName) {

        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }

    public Employee getEmp(Integer id) {

        Employee employee = employeeMapper.selectByPrimaryKey(id);

        return employee;
    }

    public void updateEmp(Employee employee) {

        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {

        EmployeeExample example = new EmployeeExample();

        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);

        employeeMapper.deleteByExample(example);
    }
}
