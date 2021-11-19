package com.like.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.like.crud.bean.Employee;
import com.like.crud.bean.Msg;
import com.like.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shkstart
 * @create 2021-11-13 22:33
 */
@Controller
public class employeeControllor {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/orderbyTime",method = RequestMethod.POST)
    @ResponseBody
    public Msg getEmpsOrdersbyTime(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn,@RequestParam(value = "sortFieldTime", required = false)String sortFieldTime,
                             @RequestParam(value="sortTypeTime" ,required = false)String sortTypeTime) {
        System.out.println("sortFieldTime=" + sortFieldTime + "sortTypeTime= " +sortTypeTime);
                PageHelper.startPage(pn, 5);
                List<Employee> emps = employeeService.getAllOrder(sortFieldTime, sortTypeTime);
                //                for (Employee emp : emps) {
                //                    emps.add(emp);
                //                }
                //                List<Employee> emps=employeeService.getAll();
                //使用pageinfo将查询结果包装起来
                //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
                PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
                return Msg.sucess().add("pageInfo", page);
            }
    @RequestMapping("/orderbyTime")
    @ResponseBody
    public Msg getEmpsOrdersbyTime(@RequestParam(value = "sortFieldTime", required = false)String sortFieldTime,
                                   @RequestParam(value="sortTypeTime" ,required = false)String sortTypeTime) {
        System.out.println(sortFieldTime + "," + sortTypeTime);

        PageHelper.startPage(1, 5);
        List<Employee> emps = employeeService.getAllOrder(sortFieldTime, sortTypeTime);
        //                for (Employee emp : emps) {
        //                    emps.add(emp);
        //                }
        //                List<Employee> emps=employeeService.getAll();
        //使用pageinfo将查询结果包装起来
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
        return Msg.sucess().add("pageInfo", page);
    }





    //    @RequestMapping("/emp")
//    @ResponseBody
//    public Msg getEmpsOrder(@RequestParam(value = "pn",defaultValue = "1") Integer pn,@RequestParam(value = "sortField", required = false)String sortField,
//                            @RequestParam(value="sortType" ,required = false)String sortType){
//        //引入pagehelperfe分页插件
//        //查询之前只需要调用,传入页码，每页的大小
////        satrtpage后的查询就是一个分页查询
//        PageHelper.startPage(pn,5);
////         List<Employee> emps = employeeService.getAllOrder(sortField, sortType);
////         for (Employee emp : emps) {
////             emps.add(emp);
////         }
////        List<Employee> emps=employeeService.getAll();
//        //使用pageinfo将查询结果包装起来
//        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
////        PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
////        return Msg.sucess().add("pageInfo",page);
////
////
////            List<Employee> emps = new ArrayList<>();
////            PageHelper.startPage(pn,5);
////            List<Employee> employee = employeeService.getAllOrder(sortField, sortType);
////            for (Employee emp : employee) {
////                emps.add(emp);
////            }
////            //使用pageinfo将查询结果包装起来
////            //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
////            PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
////            return Msg.sucess().add("pageInfo",page);
//        return Msg.sucess();
//
//    }
                @RequestMapping(value = "/order",method = RequestMethod.POST)
                @ResponseBody
                public Msg getEmpsOrders(@RequestParam(value = "pn" ,defaultValue = "1") Integer pn,@RequestParam(value = "sortField", required = false)String sortField,
                                @RequestParam(value="sortType" ,required = false)String sortType) {
                    System.out.println(sortField + "," + sortType);

                    PageHelper.startPage(pn, 5);
                    List<Employee> emps = employeeService.getAllOrder(sortField, sortType);
                    //                for (Employee emp : emps) {
                    //                    emps.add(emp);
                    //                }
                    //                List<Employee> emps=employeeService.getAll();
                    //使用pageinfo将查询结果包装起来
                    //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
                    PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
                    return Msg.sucess().add("pageInfo", page);
                }

                    @RequestMapping("/order")
                    @ResponseBody
                    public Msg getEmpsOrder(@RequestParam(value = "sortField", required = false)String sortField,
                                       @RequestParam(value="sortType" ,required = false)String sortType){
                        System.out.println("sortField="+sortField + "," + "sortType= " +sortType);
                                PageHelper.startPage(1,5);
                                List<Employee> emps = employeeService.getAllOrder(sortField, sortType);
                //                for (Employee emp : emps) {
                //                    emps.add(emp);
                //                }
                //                List<Employee> emps=employeeService.getAll();
                                //使用pageinfo将查询结果包装起来
                                //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
                                PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
                                return Msg.sucess().add("pageInfo",page);
                    }


    /**
     * 批量、单个删除
     * @param
     * @return
     */
//    @RequestMapping(value = "/order",method = RequestMethod.GET)
//    @ResponseBody
//    public Msg orderby(@RequestParam(value = "sortField") String sortField,@RequestParam(value = "sortType") String sortType,@RequestParam(value = "id")Integer id ){
//        System.out.println("sortField="+sortField + "," + "sortType=" + sortType );
//       Employee employee = (Employee) employeeService.getAllOrder(sortField,sortType);
//        return Msg.sucess().add("emp",employee);
//    }

    @RequestMapping(value = "/emps/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delete(@PathVariable("ids")String ids){
        if(ids.contains(",")){
            List<Integer> list = new ArrayList<>();
            String[] str_id = ids.split(",");
            for (String s : str_id) {
                list.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(list);
        }else {
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        System.out.println(1111111111);
        return Msg.sucess();
    }

    /**
     * 请求体中有数据
     * 但是employee对象封装不上
     *
     * 原因：tomcat:
     * 将请求体中的数据封装为一个map，
     * request.getParamerter()就会从map中取值
     * springmvc封装对象时会把每个属性的值封装
     * ajax发送put请求，请求体数据request.getParamerter()拿不到，
     * tomcat看是put请求就不会将数据封装到map中，没有办法拿到，只有post请求体封装为map
     * 解决：配置HttpPutFormContentFilter过滤器，将请求体中的数据解析成一个map，重新包装request请求，request.getparmeter被重写
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Msg.sucess();
    }

    @RequestMapping(value="/emps/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){

       Employee employee =  employeeService.getEmp(id);

       return Msg.sucess().add("emp",employee);

    }

    @RequestMapping(value = "/checkUser",method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){

        //正则表达式验证
        String rejx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]+$)";

        if(!empName.matches(rejx)){
            return Msg.fail().add("msgs","用户名输入格式有问题！");
        }

       Boolean b =  employeeService.checkUser(empName);
       if(b){
           return Msg.sucess();
       }else {
           return Msg.fail().add("msgs","用户名已存在");
       }
    }

    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee,BindingResult result){
        if(result.hasErrors()){
            //校验失败，在模态框中显示校验失败的信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段是：" + error.getField());
                System.out.println("错误的信息是：" + error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("erroFiler",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.sucess();
        }
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, @RequestParam(value = "sortField", required = false)String sortField,
                       @RequestParam(value="sortType" ,required = false)String sortType){
        //引入pagehelperfe分页插件
        //查询之前只需要调用,传入页码，每页的大小
//        satrtpage后的查询就是一个分页查询
            PageHelper.startPage(pn,5);
            List<Employee> emps=employeeService.getAll();
            //使用pageinfo将查询结果包装起来
            //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
            PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
            return Msg.sucess().add("pageInfo",page);
    }

    /**
     * 查询所有员工
     * 分页查询
     * @return
     */
//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn,@RequestParam(value = "sortField", required = false)String sortField,
//                          @RequestParam(value="sortType" ,required = false)String sortType, Model model){
//        //引入pagehelperfe分页插件
//        //查询之前只需要调用,传入页码，每页的大小
////        satrtpage后的查询就是一个分页查询
//        PageHelper.startPage(pn,5);
//          List<Employee> emps=employeeService.getAll();
//          //使用pageinfo将查询结果包装起来
//        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
//        PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
//        model.addAttribute("pageInfo",page);
//        return "list";
//
//    }
}
