package com.like.crud.test;

import com.github.pagehelper.PageInfo;
import com.like.crud.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用spring模块提供的测试，测试crud的测试正确性
 * @author shkstart
 * @create 2021-11-14 0:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
    //传入springmvc的ioc容器
    @Autowired
    WebApplicationContext context ;
    //虚拟mvc请求，获取到mvc结果
    MockMvc mockMvc;
    @Before
    public void initMokcMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void test() throws Exception {
        //perform模拟mvc发送请求,拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1")).andReturn();
        //请求成功以后，请求域中会有pageInfo,我们可以取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo info = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码 " + info.getPageNum());
        System.out.println("总页码 " + info.getPages());
        System.out.println("总记录数 " + info.getTotal());
        System.out.println("页面中连续显示的页码");
        int[] nums = info.getNavigatepageNums();
        for (int num : nums) {
            System.out.println("  " + num);
        }
        //获取员工数据
        List<Employee> list = info.getList();
        for (Employee employee : list) {
            System.out.println("ID " + employee.getEmpId() + "Name  " + employee.getEmpName());
        }
    }
    @Test
    public void test2(){

    }
}
