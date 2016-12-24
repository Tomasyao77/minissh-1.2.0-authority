var modalToggle = function (obj) {
    var whichModal = $(obj).text();
    if(whichModal.indexOf("系统消息") !=- 1){
        alert("no message");
    }else if(whichModal.indexOf("编辑") !=- 1){
        $("#modalid-editInfo").modal("toggle");
    }else if(whichModal.indexOf("注销") !=- 1){
        $("#modalid-offconf").modal("toggle");
    }
};
var offFunction = function(){
    window.location.href = "/login.html";
};

//angularModuleStart
angular.module("mainapp",[])
    .constant('constRef',[["查看详情","分配角色","删除"],//user table
        ["首页","用户管理","文件管理","角色管理"],//left nav bar
        ["查看详情","删除","新增角色","搜索"]])// role table
    .controller("maincontroller",function($scope,constRef){
        $scope.currentPage = 0;
        $scope.totalPage = 0;
        $scope.prevPage = "上一页";
        $scope.nextPage = "下一页";
        $scope.constRef = constRef;

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

                $scope.getRolePageList();
            }
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
        $scope.beforePaging = function(obj){
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
                url:"/login/getUserPageList",
                data:{"currentPage":this.currentPage,"pageSize":5},
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
                $("#modalid-viewInfo").modal("toggle");
                $scope.userViewInfo = item;
                console.log($scope.userViewInfo);
            }else if(obj == "分配角色"){

            }else if(obj == "删除"){
                $scope.deleteOneUserItem = item;
                $("#modalid-delUserConf").modal("toggle");
            }
        };
        $scope.actionOnRole = function(item,obj){
            if(obj == "新增角色"){
                $scope.newRoleName = "";
                $("#modalid-newRole").modal("toggle");
            }else if(obj == "搜索"){

            }else if(obj == "查看详情"){

            }else if(obj == "删除"){
                $scope.deleteOneRoleItem = item;
                $("#modalid-delRoleConf").modal("toggle");
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
            $.ajax({
                type:"POST",
                url:"/user_role/addRole",
                data:{"roleName":$scope.newRoleName},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.newRoleName = "";
                    $scope.getRolePageList();
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
                url:"/user_role/getRolePageList",
                data:{"currentPage":this.currentPage,"pageSize":5},
                contentType:"application/x-www-form-urlencoded",
                dataType:"json",
                success:function(data){
                    console.log(data);
                    $scope.$apply(function(){
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

