package com.like.crud.test;
import com.like.crud.bean.Department;
import com.like.crud.bean.DepartmentExample;
import com.like.crud.bean.Employee;
import com.like.crud.dao.DepartmentMapper;
import com.like.crud.dao.EmployeeMapper;
import com.like.crud.service.EmployeeService;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**测试dao层
 * @author shkstart
 * @create 2021-11-13 0:32
 * 推荐使用spring的单元测试
 * 1.导入spring模块
 * 2.使用@ContextConfiguration指定配置文件的位置
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext.xml")
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Autowired
    EmployeeService employeeService;
   @Test
    public void test(){
//        //创建spring容器
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("ApplicationContext.xml");
//        //从容器中获取mapper
//        EmployeeMapper bean = ioc.getBean(EmployeeMapper.class);
//        System.out.println(departmentMapper);


        //1.插入部门信息
//       departmentMapper.insert(new Department(1,"aa"));
//       departmentMapper.insertSelective(new Department(null,"ss"));
       //2.插入员工
//     employeeMapper.insert(new Employee(null,"jk","男","jk@qq.com",1));
//       employeeMapper.insertSelective(new Employee(null,"ss","nv","ss@qq.com",2));
//       EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//       for (int i = 0; i <1000 ; i++) {
//           String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
//           mapper.insertSelective(new Employee(null,uuid,"M",uuid+"@qq.com",1,null,null));
//       }
//       System.out.println("批量执行完成");
////       departmentMapper.selectByExample()
//       EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//       for (int i = 0; i <100 ; i++) {
//           String uuid = UUID.randomUUID().toString().substring(0,4)+i;
//           mapper.insertSelective(new Employee(null,uuid,"M",uuid + "@qq.com" ,1,new Date(),50+i));
//       }
//       System.out.println("执行完成");
//
       List<Employee> allOrder = employeeService.getAllOrder("score", "asc");
       for (Employee employee : allOrder) {
           System.out.println(employee.toString());
       }
//       List<Employee> emps=employeeService.getAll();
//       for (Employee emp : emps) {
//           System.out.println(emp);
//
//       }

   }
   @Test
    public void test1(){
       Boolean b = employeeService.checkUser("aaaaaa");
       System.out.println(b);
   }
}
