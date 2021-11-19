<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
        <%
            pageContext.setAttribute("PATH",request.getContextPath());
        %>
    <%--引入jueqry--%>
    <script type="text/javascript" src="${PATH}/static/js/jquery-1.7.2.min.js"></script>
    <%--引入样式--%>
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
        <%--搭建显示页面--%>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>SSM-CRUD</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-12">
                    <button class="btn btn-primary">新增</button>
                    <button class="btn btn-danger">删除</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <tr>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                            <th>
                                <button id="time">时间</button>
                            </th>
                            <th>
                                <button id="score">分数</button>
                            </th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="emps">
                        <tr>
                            <td>${emps.empId}</td>
                            <td>${emps.empName}</td>
                            <td>${emps.gender=="M" ? "男":"女"}</td>
                            <td>${emps.empEmail}</td>
                            <td>${emps.department.dptName}</td>
                            <td>
                                <button class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                                </button>
                            </td>
                            <td>${emps.create_time}</td>
                            <td>${emps.score}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <%--显示分页信息--%>
            <div class="row">
                <%--分页文字信息--%>
                <div class="col-md-6">
                    当前${pageInfo.pageNum}页,总共${pageInfo.pages}页,总共${pageInfo.total}条记录
                </div>
                <%--分页条--%>
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li>
                                    <a href="${PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="${PATH}/emps?pn=1">首页</a></li>
                            </c:if>

                            <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                <c:if test="${page_num == pageInfo.pageNum}">
                                    <li class="active"><a  href="#">${page_num}</a></li>
                                </c:if>
                                <c:if test="${page_num != pageInfo.pageNum}">
                                    <li><a href="${PATH}/emps?pn=${page_num}">${page_num}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageInfo.hasNextPage}">
                                <li>
                                    <a href="${PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                <li><a href="${PATH}/emps?pn=${pageInfo.pages}">末页</a> </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

</body>
<script>
    //获取点击按钮时间
    var timeButton = getElementById("#time");
    timeButton.click = function(){

        //获取点击状态
        //1、拿上一步状态  如没有  给默认状态     1   2
        //获取当前状态    假如就是上一步状态+1  如果上一步状态为3  则当前状态就为1
        //保存当前状态
        //进行请求，查数据
        //emp?sortField=?&sortType=?
    }
</script>
</html>
