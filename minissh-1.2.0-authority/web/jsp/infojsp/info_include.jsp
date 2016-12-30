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
<!-- 编辑Loger个人信息  模态弹出框 -->
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
                            <input type="text" class="form-control" id="username" ng-model="editLogerArray[0].username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="email" ng-model="editLogerArray[0].email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tel" ng-model="editLogerArray[0].tel">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="editLoger()"
                        ng-disabled="editLogerArray[0].email == '' || editLogerArray[0].username == '' ||
                         editLogerArray[0].tel == '' || editLogerArray[0].email == null || editLogerArray[0].username == null ||
                         editLogerArray[0].tel == null ">提交</button>
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
                            <div ng-repeat="item in roleSimpleList">
                                <label class="checkbox-inline"><input type="checkbox" ng-checked="ifSetChecked(item)" ng-click="roleForUserCheckBoxs($event,item)"><span ng-bind="item.roleName"></span></label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="roleForOneUser()">提交</button>
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
                <button type="button" id="btnid-roleeditsubmit" ng-disabled="roleViewInfo.name == '' || roleViewInfo.name == null" ng-click="editRole(constRef[2][6])" style="display: none;" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp;<span ng-bind="constRef[2][6]"></span></button>
                <button type="button" id="btnid-roleeditcancel" ng-click="editRole(constRef[2][5])" style="display: none;" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>&nbsp;<span ng-bind="constRef[2][5]"></span></button>
                <button type="button" id="btnid-roleedit" ng-click="editRole(constRef[2][4])" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span>&nbsp;<span ng-bind="constRef[2][4]"></span></button>
                <button type="button" id="btnid-roleeditok" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span>&nbsp;OK</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 查看某一角色所包含的用户列表信息  模态弹出框 -->
<div class="modal fade" id="modalid-viewUserListOfOneRole">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <!--  >模态弹出窗标题<  -->
                <h4 class="modal-title">用户信息</h4>
            </div>
            <div class="modal-body">
                <!--  >模态弹出窗主体内容<  -->
                <form class="form-horizontal" role="form">
                    <table class="table table-hover table-striped table-bordered">
                        <caption>角色所含用户列表</caption>
                        <thead>
                        <tr><th>用户名</th><th>电话</th><th>邮箱</th><th>创建时间</th><th>操作</th></tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in userListOfOneRole">
                            <td ng-bind="item.username"></td>
                            <td ng-bind="item.tel"></td>
                            <td ng-bind="item.email"></td>
                            <td ng-bind="item.createTime"></td>
                            <td><button ng-click="unFriendUserOfRoleModalToggle(item,constRef[2][1])" type="button" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove"></span>&nbsp;<span ng-bind="constRef[2][1]"></span></button></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span>&nbsp;OK</button>
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
                    <%--<div class="form-group">
                        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">权限</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="authority">
                        </div>
                    </div>--%>
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

<!-- 删除角色下的用户 确认 模态弹出框-->
<div class="modal fade" id="modalid-delUserOfRoleConf">
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
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="unFriendUserOfRole(deleteUserOfRole)">确定</button>
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

<!-- 提示信息 模态弹出框-->
<div class="modal fade" id="modalid-toastInfo">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p><span ng-bind="justForModalInfomation"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
