<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>

    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>

    <%--引入jueqry--%>
    <script type="text/javascript" src="${PATH}/static/js/jquery.min.js"></script>
    <%--引入样式--%>
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <%--<script type="text/javascript">--%>
        <%--function gettime(){--%>
            <%--var d = new Date();--%>
            <%--document.getElementById("time").innerHTML=d;--%>
            <%--window.setTimeout("gettime()",1000);--%>
        <%--};--%>
        <%--window.οnlοad=gettime;--%>
    <%--</script>--%>

</head>
<body>

<!-- Modal添加员工的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empEmail</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empEmail" id="email_add_input" placeholder="email@qq.com">
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id--%>
                            <select class="form-control" name="dId" id="add_dept_name">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">score</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="score" id="score_add_input" placeholder="0">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_emp">保存提交</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empEmail</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empEmail" id="email_update_input" placeholder="email@qq.com">
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%--部门提交部门id--%>
                            <select class="form-control" name="dId" id="update_dept_name">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">score</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="score" id="score_update_input" placeholder="0">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_emp">更新提交</button>
            </div>
        </div>
    </div>
</div>
<%--搭建显示页面--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-12">
            <button class="btn btn-primary" id="add_emp_btn" >新增</button>
            <button class="btn btn-danger" id="del_emp_patch">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emp_table">
                <thead id="thed">
                <tr id="1">
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                    <th>
                        <button id="create_time">时间</button>
                    </th>
                    <th>
                        <button id="score">分数</button>
                    </th>
                </tr>
                </thead>
                <tbody id="tbody">

                </tbody>

            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row" >
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info">
            当前 页,总共 页,总共条记录
        </div>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav">

        </div>
    </div>
</div>
<script type="text/javascript">
    //页面加载完成，直接发送ajax请求
    $(function () {
        var totalAround;
        var currenPage;
        to_page(1);
    });
    function to_page(pn) {
                $.ajax({
                    url:"${PATH}/emps",
                    data:"pn=" + pn ,
                    type:"GET",
                    success:function (result) {
                        console.log(result);
                        //解析员工数据
                        build_emp_table(result);
                        //解析分写信息
                        build_pageInfo(result);
                        //显示分页条信息
                        build_page_nav(result);
            }
       });
    }
    function to_pageorder(pn,sortField,sortType) {
        $.ajax({
            url:"${PATH}/order",
            data:"pn=" + pn +"&sortField=" + sortField + "&sortType="+sortType ,
            type:"POST",
            success:function (result) {
                console.log(result);
                //解析员工数据
                build_emp_table(result);
                //解析分写信息
                build_pageInfo(result);
                //解析显示分页条
                build_page_nav_order(result);
            }
        });
    }
    function to_pageorderbyTime(pn,sortFieldTime,sortTypeTime) {
        $.ajax({
            url:"${PATH}/orderbyTime",
            data:"pn=" + pn +"&sortFieldTime=" + sortFieldTime + "&sortTypeTime="+sortTypeTime ,
            type:"POST",
            success:function (result) {
                console.log(result);
                //解析员工数据
                build_emp_table(result);
                //解析分写信息
                build_pageInfo(result);
                //解析显示分页条
                build_page_nav_orderBytime(result);
            }
        });
    }


    function build_emp_table(result) {
        //清空数据
        $("#emp_table tbody").empty();
        var emp = result.extend.pageInfo.list;
        $.each(emp,function (index,item) {
            var checkebox=$("<td></td>").append($("<input type='checkbox' class='check_item'>"));
           var empIdTd = $("<td></td>").addClass("td-class").append(item.empId);
           var empNameTd = $("<td></td>").append(item.empName);
           var gender = $("<td></td>").append(item.gender == 'M'?"男" :"女");
           var empEmil = $("<td></td>").append(item.empEmail);
           var deptName = $("<td></td>").append(item.department.dptName);
            /**
             * <td>
             <button class="btn btn-primary">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑
             </button>
             <button class="btn btn-danger">
             <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
             删除
             </button>
             </td>
             * @type {*|{start, end, endencode}|void|jQuery}
             */
            var editButton =$("<button></button>")
                .addClass("btn btn-primary edit_btn")
                .append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            editButton.attr("edit-id",item.empId);
            var dettButton = $("<button></button>")
                .addClass("btn btn-danger del_btn")
                .append($("<span></span>")
                .addClass("glyphicon glyphicon-trash"))
                .append("删除");
            dettButton.attr("del-id",item.empId);
            var btnTd = $("<td></td>")
                .append(editButton)
                .append(" ")
                .append(dettButton);
           var CreateTime = $("<td></td>"
           ).append(item.create_time);
           var scoreTd = $("<td></td>")
               .append(item.score);
            $("<tr></tr>")
                .append(checkebox)
                .append(empIdTd)
                .append(empNameTd)
                .append(gender).append(empEmil).append(deptName)
                .append(btnTd).append(CreateTime)
                .append(scoreTd)
                .appendTo("#emp_table tbody");
        });
    }
    //解析显示分页条
    function build_page_nav(result) {
        //清空数据
        $("#page_nav").empty();
        //添加ul标签
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }else{
            firstPage.click(function () {
                to_page(1);
            });
            prePage.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }

        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }else{
            nextPage.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);
            });
            lastPage.click(function () {
                to_page(result.extend.pageInfo.pages)
            });
        }


        //添加首页和上一页
        ul.append(firstPage).append(prePage);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item)
            });
            //添加导航总页
            ul.append(numLi)
        });
        //添加下一页和末页
        ul.append(nextPage).append(lastPage);

        //添加nv标签
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    };

    //解析显示分页条
    function build_page_nav_order(result) {
        //清空数据
        $("#page_nav").empty();
        //添加ul标签
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }else{
            firstPage.click(function () {
                to_pageorder(1,sortField,sortType);
            });
            prePage.click(function () {
                to_pageorder(result.extend.pageInfo.pageNum-1,sortField,sortType);
            });
        }

        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }else{
            nextPage.click(function () {
                to_pageorder(result.extend.pageInfo.pageNum+1,sortField,sortType);
            });
            lastPage.click(function () {
                to_pageorder(result.extend.pageInfo.pages,sortField,sortType)
            });
        }


        //添加首页和上一页
        ul.append(firstPage).append(prePage);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_pageorder(item,sortField,sortType)
            });
            //添加导航总页
            ul.append(numLi)
        });
        //添加下一页和末页
        ul.append(nextPage).append(lastPage);

        //添加nv标签
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    };
    //解析显示分页条
    function build_page_nav_orderBytime(result) {
        //清空数据
        $("#page_nav").empty();
        //添加ul标签
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }else{
            firstPage.click(function () {
                to_pageorderbyTime(1,sortFieldTime,sortTypeTime);
            });
            prePage.click(function () {
                to_pageorderbyTime(result.extend.pageInfo.pageNum-1,sortFieldTime,sortTypeTime);
            });
        }

        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }else{
            nextPage.click(function () {
                to_pageorderbyTime(result.extend.pageInfo.pageNum+1,sortFieldTime,sortTypeTime);
            });
            lastPage.click(function () {
                to_pageorderbyTime(result.extend.pageInfo.pages,sortFieldTime,sortTypeTime)
            });
        }


        //添加首页和上一页
        ul.append(firstPage).append(prePage);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_pageorderbyTime(item,sortFieldTime,sortTypeTime)
            });
            //添加导航总页
            ul.append(numLi)
        });
        //添加下一页和末页
        ul.append(nextPage).append(lastPage);

        //添加nv标签
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    };



    // 解析显示分页信息
    function build_pageInfo(result) {

        //清空数据
        $("#page_info").empty();
        $("#page_info").append("当前"+ result.extend.pageInfo.pageNum  + "页,总共" + result.extend.pageInfo.pages  + "页,总共" + result.extend.pageInfo.total + "条记录");
        totalAround = result.extend.pageInfo.total;
        currenPage = result.extend.pageInfo.pageNum;

    };

    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");

    }
    //绑定单击事件
    $("#add_emp_btn").click(function () {
        //清楚表单重置
        reset_form("#empAddModal form");
        // $("#empAddModal form")[0].reset();
        getDeptName("#add_dept_name");
        //弹出模块框
        $('#empAddModal').modal({
            backdrop:"static"
        });
    });
    //获取员工部门信息
      function getDeptName(ele) {
          //清空下拉列表信息
          $(ele).empty();
          $.ajax({
              url:"${PATH}/depts",
              type:"GET",
              success:function (result) {
                  $.each(result.extend.dept,function () {
                      var deptTd = $("<option></option>").append(this.dptName).attr("value",this.dptId);
                      deptTd.appendTo(ele);
                  });

              }
          })
      };

      function validit_add_form() {
          //拿到数据，使用正则表达式
          var empName =$("#empName_add_input").val();
          var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]+$)/;
          if(!regName.test(empName)){
              // alert("用户名输入不合法！！！");
              vilidate_form("#empName_add_input","error", "用户名输入不合法！！！")
              // $("#empName_add_input").parent().addClass("has-error");
              // $("#empName_add_input").next("span").text("用户名输入不合法！！！");
              return false;
          }else {
              vilidate_form("#empName_add_input","success", "");
              // $("#empName_add_input").parent().addClass("has-success");
              // $("#empName_add_input").next("span").text("");
          }
          //校验邮箱
          var empEmail = $("#email_add_input").val();
          var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
          if(!regEmail.test(empEmail)){
              // alert("邮箱输入格式不正确！！！");
              vilidate_form("#email_add_input", "error", "邮箱输入格式不正确！！！");
              // $("#email_add_input").parent().addClass("has-error");
              // $("#email_add_input").next("span").text("邮箱输入格式不正确！！！");
              return false;
          }else {
              vilidate_form("#email_add_input", "success", "");
              // $("#email_add_input").parent().addClass("has-success");
              // $("#email_add_input").next("span").text("");
          }
          return true;
      }
    function vilidate_form(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);

        }else if("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
      $("#empName_add_input").change(function () {
          var empName = this.value;
          $.ajax({
              url:"${PATH}/checkUser",
              type:"POST",
              data:"empName=" + empName,
              success: function (result) {
                        if(result.code== 100){
                            vilidate_form("#empName_add_input", "success", "用户名可用");
                            $("#save_emp").attr("ajaxvalue","success");
                        }else {
                            vilidate_form("#empName_add_input", "error", result.extend.msgs);
                            $("#save_emp").attr("ajaxvalue","fail");
                 }
              }
          });
      });


      $("#save_emp").click(function () {
          //填写的数据提交给服务器保存
          //首先对服务器提交的数据进行验证
          if(!validit_add_form()){
              return false;
          };
          if($(this).attr("ajaxvalue") == "fail"){
              return false;
          }

          $.ajax({
              url:"${PATH}/emps",
              type:"POST",
              data:$("#empAddModal form").serialize(),
              success:function (result) {
                 // alert(result.msg);
                  if(result.code==100){
                      //关闭模块框
                      $("#empAddModal").modal('hide');
                      //跳转到最后一页
                      to_page(totalAround);
                  }else{
                      //如果未定义显示的不是邮箱的信息
                      //有那个字段的信息显示那个字段的错误信息
                      if(undefined != result.extend.erroFiler.empEmail){
                          vilidate_form("#email_add_input", "error", result.extend.erroFiler.empEmail);

                      }
                      //如果未定义显示的不是用户名的信息
                      if(undefined != result.extend.erroFiler.empName){
                          vilidate_form("#empName_add_input", "error", result.extend.erroFiler.empName);
                      }
                  }

              }
          });
      });


      //1.我们在创建按钮之前就绑定了click事件，所以现在绑不上
    //（1）可以在创建按钮时候绑定；2）可以绑定live（方法已经不支持），使用on进行替代
    $(document).on("click",".edit_btn",function () {
        // alert("edit")
        //查出员工信息。显示员工信息
        getEmp($(this).attr("edit-id"));
        //查出部门列表并显示
        getDeptName("#update_dept_name");
        //弹出模块框
        //将员工id传给更新按钮
        $("#update_emp").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });

    });
    function getEmp(id) {
        $.ajax({
            url:"${PATH}/emps/"+id,
            type:"GET",
            success: function(result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.empEmail);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#update_dept_name").val([empData.dId]);

            }
        });
    }
    $("#update_emp").click(function () {
        //验证邮箱是否合法
        var empEmail = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(empEmail)){
            // alert("邮箱输入格式不正确！！！");
            vilidate_form("#email_add_input", "error", "邮箱输入格式不正确！！！");
            // $("#email_add_input").parent().addClass("has-error");
            // $("#email_add_input").next("span").text("邮箱输入格式不正确！！！");
            return false;
        }else {
            vilidate_form("#email_add_input", "success", "");
            // $("#email_add_input").parent().addClass("has-success");
            // $("#email_add_input").next("span").text("");
        }
        $.ajax({
            url:"${PATH}/emps/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                // alert(result.msg);
                //关闭模块框
                $("#empUpdateModal").modal('hide');
                //回到本页面
                to_page(currenPage);

            }
        });
    });
    $(document).on("click",".del_btn",function () {
        //弹出对话框
       var empName =  $(this).parents("tr").find("td:eq(2)").text();
       var id =  $(this).attr("del-id");
       //  var empId =  $(this).parents("tr").find("td:eq(0)").text();
       if(confirm("是否要删除【"+ empName +"】")){
           $.ajax({
               url:"${PATH}/emps/" + id,
               type:"DELETE",
               success:function (result) {

                   to_page(currenPage);
               }
           });
       }

    });
    //完成全选/全不选
    $("#check_all").click(function () {
        //attr获取的值是undefind,用于自定义属性
        //prop读取dom原生属性的值

        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function () {
        //判断当前选中的元素
       var flag =  $(".check_item:checked").length == $(".check_item").length;
       $("#check_all").prop("checked",flag);
    });
    //点击全部删除，批量删除
    $("#del_emp_patch").click(function () {
        //
        var empName ="";
        var del_lis ="";
        $.each($(".check_item:checked"),function () {
            empName += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_lis += $(this).parents("tr").find("td:eq(1)").text()+",";

        });
       del_lis = del_lis.substring(0,del_lis.length-1);
        empName = empName.substring(0,empName.length-1);
        if(confirm("你确定要删除【"+ empName +"】吗？")){
            //发送ajax请求
            $.ajax({
                url:"${PATH}/emps/" + del_lis,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    //回到当前页面
                    to_page(currenPage);
                }
            });

        }
    });

    var i=0;
    var sortFieldTime = $("#create_time").prop("id");
    var sortTypeTime;
    $("#create_time").click(function () {

        if(i == 0){
            sortTypeTime = "desc";
            i++;
        }else {
            sortTypeTime = "asc";
            i--;
        }
        $.ajax({
            url:"${PATH}/orderbyTime",
            type:"GET",
            data:"sortFieldTime="+sortFieldTime + "&sortTypeTime="+sortTypeTime,
            success:function (result) {
                console.log(result);
                //解析员工数据
                to_pageorderbyTime(currenPage,sortFieldTime,sortTypeTime);


            }
        });

    });

        //绑定按钮的单击事件
    var j=0;
    var sortField = $("#score").prop("id");
    var sortType;
    $("#score").click(function () {

        if(j == 0){
            sortType = "desc";
            j++;
        }else {
            sortType = "asc";
            j--;
        }
        $.ajax({
            url:"${PATH}/order",
            type:"GET",
            data:"sortField="+sortField + "&sortType="+sortType,
            success:function (result) {
              console.log(result);
                //解析员工数据
                to_pageorder(currenPage,sortField,sortType);

            }
        });

    });
    <%--function to_pageOrder(sortField,sortType) {--%>
        <%--$.ajax({--%>
            <%--url:"${PATH}/emp",--%>
            <%--data:"sortField=" + sortField + "&sortType=" + sortType,--%>
            <%--type:"GET",--%>
            <%--success:function (result) {--%>

                <%--console.log(result);--%>
                <%--//解析员工数据--%>
                <%--build_emp_table(result);--%>
                <%--//解析分写信息--%>
                <%--build_pageInfo(result);--%>
                <%--//显示分页条信息--%>
                <%--build_page_nav(result);--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
</script>

</body>
<%--<script>--%>
    <%--//获取点击按钮时间--%>
    <%--var timeButton = getElementById("#time");--%>
    <%--timeButton.click = function(){--%>

        <%--//获取点击状态--%>
        <%--//1、拿上一步状态  如没有  给默认状态     1   2--%>
        <%--//获取当前状态    假如就是上一步状态+1  如果上一步状态为3  则当前状态就为1--%>
        <%--//保存当前状态--%>
        <%--//进行请求，查数据--%>
        <%--//emp?sortField=?&sortType=?--%>
    <%--}--%>
<%--</script>--%>
</html>