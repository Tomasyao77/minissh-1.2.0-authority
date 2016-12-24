<%--
  Created by IntelliJ IDEA.
  User: zouy
  Date: 2016/12/24
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>modal jsp</title>
</head>
<body>
<!-- 编辑个人信息  模态弹出框 -->
<div class="modal fade" id="modalid-editInfo">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <!--  >模态弹出窗标题<  -->
                <h4 class="modal-title">编辑信息</h4>
            </div>
            <div class="modal-body">
                <!--  >模态弹出窗主体内容<  -->
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="username" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tel" placeholder="请输入电话">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="transferWork()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 查看用户信息  模态弹出框 -->
<div class="modal fade" id="modalid-viewInfo">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <!--  >模态弹出窗标题<  -->
                <h4 class="modal-title">用户信息</h4>
            </div>
            <div class="modal-body">
                <!--  >模态弹出窗主体内容<  -->
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 col-sm-offset-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="username" ng-model="userViewInfo.username" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="email" ng-model="userViewInfo.email" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-sm-2 col-sm-offset-2 control-label">电话</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="tel" ng-model="userViewInfo.tel" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="createTime" class="col-sm-2 col-sm-offset-2 control-label">创建时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="createTime" ng-model="userViewInfo.createTime" disabled>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除确认 模态弹出框-->
<div class="modal fade" id="modalid-delconf">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>确认要删除吗?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="deleteOne(deleteOneItem)">确定</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 注销确认 模态弹出框-->
<div class="modal fade" id="modalid-offconf">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>确认要注销吗?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="offFunction()">确定</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
