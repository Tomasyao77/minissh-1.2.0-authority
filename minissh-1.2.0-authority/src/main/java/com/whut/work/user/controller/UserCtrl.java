package com.whut.work.user.controller;

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
        System.out.println(roleName);
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
}
