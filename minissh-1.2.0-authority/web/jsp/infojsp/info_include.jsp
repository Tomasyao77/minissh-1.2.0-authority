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

<!-- 为用户分配角色  模态弹出框 -->
<div class="modal fade" id="modalid-roleForUser">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <!--  >模态弹出窗标题<  -->
                <h4 class="modal-title">分配角色</h4>
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
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">角色</label>
                        <div class="col-sm-6">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="inlineCheckbox1" value="option1"> 选项 1
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" id="inlineCheckbox2" value="option2"> 选项 2
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" id="inlineCheckbox3" value="option3"> 选项 3
                            </label>
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

<!-- 查看角色信息  模态弹出框 -->
<div class="modal fade" id="modalid-viewRoleInfo">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <!--  >模态弹出窗标题<  -->
                <h4 class="modal-title">角色信息</h4>
            </div>
            <div class="modal-body">
                <!--  >模态弹出窗主体内容<  -->
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputid-rolename" class="col-sm-2 col-sm-offset-2 control-label">角色名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputid-rolename" ng-model="roleViewInfo.name" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputid-rolecreateTime" class="col-sm-2 col-sm-offset-2 control-label">创建时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputid-rolecreateTime" ng-model="roleViewInfo.createTime" disabled>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnid-roleeditsubmit" ng-click="editRole(constRef[2][6])" style="display: none;" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp;<span ng-bind="constRef[2][6]"></span></button>
                <button type="button" id="btnid-roleeditcancel" ng-click="editRole(constRef[2][5])" style="display: none;" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>&nbsp;<span ng-bind="constRef[2][5]"></span></button>
                <button type="button" id="btnid-roleedit" ng-click="editRole(constRef[2][4])" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span>&nbsp;<span ng-bind="constRef[2][4]"></span></button>
                <button type="button" id="btnid-roleeditok" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span>&nbsp;OK</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 新增角色  模态弹出框 -->
<div class="modal fade" id="modalid-newRole">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <!--  >模态弹出窗标题<  -->
                <h4 class="modal-title">新增角色</h4>
            </div>
            <div class="modal-body">
                <!--  >模态弹出窗主体内容<  -->
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 col-sm-offset-2 control-label">角色名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="username" ng-model="newRoleName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">权限</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="authority">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addRole()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除用户 确认 模态弹出框-->
<div class="modal fade" id="modalid-delUserConf">
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
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="deleteOneUser(deleteOneUserItem)">确定</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色 确认 模态弹出框-->
<div class="modal fade" id="modalid-delRoleConf">
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
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="deleteOneRole(deleteOneRoleItem)">确定</button>
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
