var offFunction = function(){
    window.location.href = "/login.html";
};
var a = "123321";
//angularModuleStart
angular.module("mainapp",[])
    .constant('constRef',[["查看详情","分配角色","删除","搜索"],//user table
        ["首页","用户管理","文件管理","角色管理"],//left nav bar
        ["查看详情","删除","新增角色","搜索","编辑","取消","提交"],// role table
        ["系统消息","编辑","注销"]])//topOperation
    .controller("maincontroller",function($scope,constRef){
        $scope.currentPage = 0;
        $scope.totalPage = 0;
        $scope.listLength = 0;
        $scope.prevPage = "上一页";
        $scope.nextPage = "下一页";
        $scope.constRef = constRef;
        $scope.searchRoleName = "";//search role
        $scope.searchUserName = "";//search user
        $scope.justForModalInfomation = "";

        $scope.GetQueryString = function(name){
                var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if(r!=null){return  decodeURI(r[2]);} return null;
        };
        $scope.htmlInit = function(){
            $scope.usernameOfLoger = $scope.GetQueryString("userName");
            $scope.idOfLoger = $scope.GetQueryString("userId");
            if(parseInt($scope.usernameOfLoger) < 1){
                window.location.href = "/login.html";
            }
        };
        $scope.htmlInit();//init the userId(from loger)

        $scope.topOperation = function(obj){
            if(obj == "系统消息"){
                $scope.justForModalInfomation = "暂时没有消息!";
                $("#modalid-toastInfo").modal("toggle");
            }else if(obj == "编辑"){
                $scope.getLoger();
                $("#modalid-editInfo").modal("toggle");
            }else if(obj == "注销"){
                $("#modalid-offconf").modal("toggle");
            }
        };
        $scope.rightDiv = function (obj) {
            $scope.currentPage = 0;
            $scope.totalPage = 0;
            if(obj == "首页"){
                $("#divid-homepage").show();
                $("#divid-usermanage").hide();
                $("#divid-filemanage").hide();
                $("#divid-rolemanage").hide();
                $("#liid-homepage").attr("class","active");
                $("#liid-usermanage").removeClass("active");
                $("#liid-filemanage").removeClass("active");
                $("#liid-rolemanage").removeClass("active");
            }else if(obj == "用户管理"){
                $("#divid-homepage").hide();
                $("#divid-usermanage").show();
                $("#divid-filemanage").hide();
                $("#divid-rolemanage").hide();
                $("#liid-homepage").removeClass("active");
                $("#liid-usermanage").attr("class","active");
                $("#liid-filemanage").removeClass("active");
                $("#liid-rolemanage").removeClass("active");

                $scope.searchUserName = "";
                $scope.searchUserNameUrlSufix = "";
                $scope.getUserPageList();
            }else if(obj == "文件管理"){
                $("#divid-homepage").hide();
                $("#divid-usermanage").hide();
                $("#divid-filemanage").show();
                $("#divid-rolemanage").hide();
                $("#liid-homepage").removeClass("active");
                $("#liid-usermanage").removeClass("active");
                $("#liid-filemanage").attr("class","active");
                $("#liid-rolemanage").removeClass("active");
            }else if(obj == "角色管理"){
                $("#divid-homepage").hide();
                $("#divid-usermanage").hide();
                $("#divid-filemanage").hide();
                $("#divid-rolemanage").show();
                $("#liid-homepage").removeClass("active");
                $("#liid-usermanage").removeClass("active");
                $("#liid-filemanage").removeClass("active");
                $("#liid-rolemanage").attr("class","active");

                $scope.searchRoleName = "";
                $scope.searchRoleNameUrlSufix = "";
                $scope.getRolePageList();
            }
        };
        $scope.getLoger = function(){
            $.ajax({
                type:"POST",
                url:"/login/getLoger",
                data:{"id":$scope.idOfLoger},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.$apply(function(){
                        $scope.editLogerArray = new Array();
                        var obj = {};
                        obj['id'] = data.value[0].id;
                        obj['username'] = data.value[0].username;
                        obj['email'] = data.value[0].email;
                        obj['tel'] = data.value[0].tel;
                        $scope.editLogerArray.push(obj);
                        $scope.temp = "123";
                    });
                }
            });
        };
        $scope.editLoger = function(){
            $.ajax({
                type:"POST",
                url:"/login/editLoger",
                data:{"id":$scope.idOfLoger,"username":$scope.editLogerArray[0].username,
                    "tel":$scope.editLogerArray[0].tel,"email":$scope.editLogerArray[0].email},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.$apply(function(){
                        $scope.justForModalInfomation = "编辑个人信息成功!";
                        $("#modalid-toastInfo").modal("toggle");
                    });
                }
            });
        };
        $scope.deleteOneUser = function(item){
            $.ajax({
                type:"POST",
                url:"/login/deleteOneUser",
                data:{"id":item.id},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    //console.log(data);
                    $scope.getUserPageList();
                }
            });
        };
        $scope.beforePaging = function(obj){//different tables
            var  activeId = $(".active").attr("id");
            if(activeId == "liid-usermanage"){
                $scope.makePagingList(obj,"用户管理");
            }else if(activeId == "liid-rolemanage"){
                $scope.makePagingList(obj,"角色管理");
            }
        };
        $scope.makePagingList = function(obj,str){
            if(obj=="上一页"){
                if($scope.currentPage == 0){
                    //nothing to do
                }else if($scope.currentPage == 1){
                    alert("当前已经是第一页！");//其实并不会发生，因为disabled
                }else{
                    $scope.currentPage = $scope.currentPage - 1;
                    if(str == "用户管理"){
                        $scope.getUserPageList();
                    }else if(str == "角色管理"){
                        $scope.getRolePageList();
                    }
                }
            }else if(obj=="下一页"){
                if($scope.currentPage == 0){
                    //nothing to do
                }else if($scope.currentPage == $scope.totalPage){
                    alert("当前已经是最后一页！");//其实并不会发生，因为disabled
                }else{
                    $scope.currentPage = $scope.currentPage + 1;
                    if(str == "用户管理"){
                        $scope.getUserPageList();
                    }else if(str == "角色管理"){
                        $scope.getRolePageList();
                    }
                }
            }
        };
        $scope.getUserPageList = function(){
            if($scope.currentPage == 0){
                this.currentPage = 1;
            }else{
                this.currentPage = $scope.currentPage;
            }
            $.ajax({
                type:"POST",
                url:"/login/getUserPageList"+$scope.searchUserNameUrlSufix,
                data:{"currentPage":this.currentPage,"pageSize":5,"blurUserName":$scope.searchUserName},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    /**16-11-5 16:05
                     * angularjs  必须在$scope上下文中刷新数据才能更新视图
                     * 要用$scope.$apply(function(){
				 *	//更新数据
				 *	})
                     * 用$http服务的ajax获取可以直接修改数据，因为这个服务是在$scope上下文中的，但是jquery方法不是
                     */
                    $scope.$apply(function(){
                        if(data.page.list.length == 0){
                            $scope.currentPage = $scope.currentPage - 1;
                            $scope.getUserPageList();
                        }
                        $scope.userList = new Array();
                        var obj = {};
                        for(var temp in data.page.list){
                            obj['id'] = data.page.list[temp].id;
                            obj['username'] = data.page.list[temp].username;
                            obj['email'] = data.page.list[temp].email;
                            obj['tel'] = data.page.list[temp].tel;
                            var datestr = new Date(parseInt(data.page.list[temp].createTime));
                            var temstr = datestr.getFullYear() + "年" + (parseInt(datestr.getMonth())+1) + "月" + datestr.getDate() + "日"
                            //+ datestr.getHours() + ":" + datestr.getMinutes() + ":" + datestr.getSeconds()
                                ;
                            obj['createTime'] = temstr;	//创建时间
                            $scope.userList.push(obj);obj = {};
                        }
                        //分页相关更新
                        $scope.currentPage = data.page.current;
                        $scope.totalPage = data.page.total;
                        if($scope.currentPage == 1){
                            for(var i1=0;i1<$(".btnid-prevpage").length;i1++){
                                $(".btnid-prevpage").eq(i1).attr("disabled","disabled");
                            }
                        }else{
                            for(var i2=0;i2<$(".btnid-prevpage").length;i2++){
                                $(".btnid-prevpage").eq(i2).removeAttr("disabled");
                            }
                        }
                        if($scope.currentPage == $scope.totalPage){
                            for(var i3=0;i3<$(".btnid-nextpage").length;i3++){
                                $(".btnid-nextpage").eq(i3).attr("disabled","disabled");
                            }
                        }else{
                            for(var i4=0;i4<$(".btnid-nextpage").length;i4++){
                                $(".btnid-nextpage").eq(i4).removeAttr("disabled");
                            }
                        }
                    });
                }
            });
        };
        $scope.actionOnUser = function(item,obj){
            if(obj == "查看详情"){
                $scope.userViewInfo = item;
                $("#modalid-viewInfo").modal("toggle");
                //console.log($scope.userViewInfo);
            }else if(obj == "分配角色"){
                $scope.userViewInfo = item;
                $scope.getSimpleRoleList();
                $scope.checkBoxArray = new Array();
                $("#modalid-roleForUser").modal("toggle");
            }else if(obj == "删除"){
                $scope.deleteOneUserItem = item;
                $("#modalid-delUserConf").modal("toggle");
            }else if(obj == "搜索"){
                if($scope.searchUserName != null && $scope.searchUserName != ""){
                    $scope.currentPage = 1;
                    $scope.searchUserNameUrlSufix = "ForSearch";
                    $scope.getUserPageList();
                }else{
                    //console.log($scope.searchRoleName);
                }
            }
        };
        $scope.roleForUserCheckBoxs = function($event,item){//$event类似于普通js的this对象
            //console.log(item.id);
            //console.log($event.target.checked);//被点击的checkbox是否被选中
            var obj = {};
            if($event.target.checked == true){
                $scope.checkBoxArray.push(item.id);
            }else{
                $scope.checkBoxArray.splice(
                    $scope.checkBoxArray.indexOf(item.id),1
                );
            }
            console.log($scope.checkBoxArray);
        };
        $scope.actionOnRole = function(item,obj){
            //item有的对应传入的this只是为了凑够参数
            if(obj == "新增角色"){
                $scope.newRoleName = "";
                $("#modalid-newRole").modal("toggle");
            }else if(obj == "搜索"){
                if($scope.searchRoleName != null && $scope.searchRoleName != ""){
                    $scope.currentPage = 1;
                    $scope.searchRoleNameUrlSufix = "ForSearch";
                    $scope.getRolePageList();
                }else{
                    //console.log($scope.searchRoleName);
                }
            }else if(obj == "查看详情"){
                $("#btnid-roleeditsubmit").hide();
                $("#btnid-roleeditcancel").hide();
                $("#btnid-roleedit").show();
                $("#btnid-roleeditok").show();
                $("#inputid-rolename").attr("disabled","disabled");
                $("#modalid-viewRoleInfo").modal("toggle");
                $scope.roleViewInfo = item;
                //console.log($scope.roleViewInfo);
            }else if(obj == "删除"){
                $scope.deleteOneRoleItem = item;
                $("#modalid-delRoleConf").modal("toggle");
            }
        };
        $scope.editRole = function(obj){
            if(obj == "编辑"){
                $("#inputid-rolename").removeAttr("disabled");
                $("#btnid-roleeditsubmit").show();
                $("#btnid-roleeditcancel").show();
                $("#btnid-roleedit").hide();
                $("#btnid-roleeditok").hide();
            }else if(obj == "取消"){
                $scope.getRolePageList();
            }else if(obj == "提交"){
                $.ajax({
                    type:"POST",
                    url:"/user_role/editOneRole",
                    data:{"id":$scope.roleViewInfo.id,"roleName":$scope.roleViewInfo.name},
                    contentType:"application/x-www-form-urlencoded",
                    dataType:"json",
                    success:function(data){
                        //console.log(data);
                        if(data.message == "该角色已存在"){
                            alert("该角色已存在,请重新输入");
                            $scope.getRolePageList();
                        }else{
                            alert("编辑角色成功");
                            $scope.getRolePageList();
                        }
                    },
                    fail:function(){
                        alert("修改失败");
                    }
                });
            }
        };
        $scope.deleteOneRole = function(item){
            $.ajax({
                type:"POST",
                url:"/user_role/deleteOneRole",
                data:{"id":item.id},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    //console.log(data);
                    $scope.getRolePageList();
                }
            });
        };
        $scope.addRole = function(){
            if($scope.newRoleName != null &&$scope.newRoleName != ""){
                $.ajax({
                    type:"POST",
                    url:"/user_role/addRole",
                    data:{"roleName":$scope.newRoleName},
                    contentType:"application/x-www-form-urlencoded",
                    dataType:"json",
                    success:function(data){
                        console.log(data);
                        if(data.message == "该角色已存在"){
                            $scope.$apply(function(){
                                $scope.justForModalInfomation = "该角色已存在!";
                                $("#modalid-toastInfo").modal("toggle");
                            });
                        }else{
                            var tempFunc = function(){
                                if($scope.currentPage == $scope.totalPage && $scope.listLength == 5){
                                    $scope.currentPage = $scope.currentPage + 1;
                                    $scope.getRolePageList();
                                }else if($scope.currentPage == $scope.totalPage && $scope.listLength < 5){
                                    $scope.getRolePageList();
                                }else if($scope.currentPage < $scope.totalPage){
                                    $scope.getRolePageList();
                                    $scope.currentPage = $scope.totalPage;
                                    $scope.getRolePageList();
                                }
                            };
                            tempFunc();
                        }
                        $scope.newRoleName = "";
                    }
                });
            }else{
                $scope.justForModalInfomation = "角色名不能为空!";
                $("#modalid-toastInfo").modal("toggle");
            }
        };
        $scope.roleForOneUser = function(){
            this.roleArray = "";
            for(var index in $scope.checkBoxArray){
                this.roleArray += $scope.checkBoxArray[index].toString()+"-";
            }
            console.log(this.roleArray);
            $.ajax({
                type:"POST",
                url:"/user_role/roleForOneUser",
                data:{"id":$scope.userViewInfo.id,"roleList":this.roleArray},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.$apply(function(){
                    });
                }
            });
        };
        $scope.getSimpleRoleList = function(){
            $.ajax({
                type:"POST",
                url:"/user_role/getSimpleRoleList",
                data:{},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.$apply(function(){
                        $scope.roleSimpleList = new Array();
                        var obj = {};
                        for(var temp in data.list){
                            obj['id'] = data.list[temp].id;
                            obj['roleName'] = data.list[temp].roleName;
                            $scope.roleSimpleList.push(obj);obj = {};
                        }
                    });
                }
            });
        };
        $scope.getRolePageList = function(){
            if($scope.currentPage == 0){
                this.currentPage = 1;
            }else{
                this.currentPage = $scope.currentPage;
            }
            $.ajax({
                type:"POST",
                url:"/user_role/getRolePageList"+$scope.searchRoleNameUrlSufix,
                data:{"currentPage":this.currentPage,"pageSize":5,"blurRoleName":$scope.searchRoleName},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.$apply(function(){
                        if(data.page.list.length == 0 && $scope.currentPage > 1){
                            $scope.currentPage = $scope.currentPage - 1;
                            $scope.getRolePageList();
                        }else if(data.page.list.length == 0 && $scope.currentPage == 1){
                            //此处用作提醒，完全没数据便不做操作，其实可删除
                        }
                        $scope.roleList = new Array();
                        var obj = {};
                        for(var temp in data.page.list){
                            obj['id'] = data.page.list[temp].id;
                            obj['name'] = data.page.list[temp].name;
                            var datestr = new Date(parseInt(data.page.list[temp].createTime));
                            var temstr = datestr.getFullYear() + "年" + (parseInt(datestr.getMonth())+1) + "月" + datestr.getDate() + "日"
                            //+ datestr.getHours() + ":" + datestr.getMinutes() + ":" + datestr.getSeconds()
                                ;
                            obj['createTime'] = temstr;	//创建时间
                            $scope.roleList.push(obj);obj = {};
                        }
                        //分页相关更新
                        $scope.currentPage = data.page.current;
                        $scope.totalPage = data.page.total;
                        $scope.listLength = data.page.list.length;
                        if($scope.currentPage == 1){
                            for(var i1=0;i1<$(".btnid-prevpage").length;i1++){
                                $(".btnid-prevpage").eq(i1).attr("disabled","disabled");
                            }
                        }else{
                            for(var i2=0;i2<$(".btnid-prevpage").length;i2++){
                                $(".btnid-prevpage").eq(i2).removeAttr("disabled");
                            }
                        }
                        if($scope.currentPage == $scope.totalPage){
                            for(var i3=0;i3<$(".btnid-nextpage").length;i3++){
                                $(".btnid-nextpage").eq(i3).attr("disabled","disabled");
                            }
                        }else{
                            for(var i4=0;i4<$(".btnid-nextpage").length;i4++){
                                $(".btnid-nextpage").eq(i4).removeAttr("disabled");
                            }
                        }
                    });
                }
            });
        };
    })//main controller end

