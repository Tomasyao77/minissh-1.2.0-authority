package com.whut.work.user.controller;

import com.whut.work.base.model.Page;
import com.whut.work.user.model.Role;
import com.whut.work.user.model.User;
import com.whut.work.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zouyao on 2016/12/24.
 */
@Controller
@RequestMapping("/user_role")
public class UserCtrl {

    @Autowired
    private IUserService userService;

    @RequestMapping(value="/addRole",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addRole(HttpServletRequest request,String roleName){
        Map<String,Object> returnMap = new HashMap<String,Object>();
        try {
            Map<String,Object> map = userService.addRole(roleName);
            //获取role实体
            Object object = map.get("value");
            returnMap.put("value", object);
            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：新增角色失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getRolePageList",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getRolePageList(HttpServletRequest request,int currentPage,int pageSize,String blurRoleName ){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<Role> rolePage = userService.getRolePageList(currentPage, pageSize);

            returnMap.put("page", rolePage);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：获取失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getRolePageListForSearch",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getRolePageListForSearch(HttpServletRequest request,int currentPage,int pageSize,String blurRoleName ){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Page<Role> rolePage = userService.getRolePageListForSearch(currentPage, pageSize,blurRoleName);

            returnMap.put("page", rolePage);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：获取失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getSimpleRoleList",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getSimpleRoleList(HttpServletRequest request){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            List<Role> roleList = userService.getSimpleRolePageList();

            returnMap.put("list", roleList);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：获取失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/getRoleBelongToUser",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getRoleBelongToUser(HttpServletRequest request,Integer id){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            List<Role> roleList = userService.getSimpleRolePageList();

            returnMap.put("list", roleList);
            returnMap.put("success", true);
        } catch (Exception e) {
            returnMap.put("message", "异常：获取失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/deleteOneRole",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteOneRole(HttpServletRequest request,Integer id){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> map = userService.deleteOneRole(id);

            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：操作失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/editOneRole",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> editOneRole(HttpServletRequest request,Integer id,String roleName){
        Map<String,Object> returnMap = new HashMap<String,Object>();
        try {
            Map<String,Object> map = userService.editOneRole(id, roleName);
            //获取role实体
            Object object = map.get("value");
            returnMap.put("value", object);
            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：编辑角色失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }

    @RequestMapping(value="/roleForOneUser",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> roleForOneUser(HttpServletRequest request,Integer id,String roleList){
        Map<String,Object> returnMap = new HashMap<String,Object>();

        try {
            Map<String,Object> map = userService.roleForOneUser(id, roleList);
            returnMap.put("message", map.get("message"));
            returnMap.put("success", map.get("success"));
        } catch (Exception e) {
            returnMap.put("message", "异常：为用户分配角色失败!");
            returnMap.put("success", false);
            e.printStackTrace();
        }
        return returnMap;
    }
}
