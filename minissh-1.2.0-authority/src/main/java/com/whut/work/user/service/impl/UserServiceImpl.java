package com.whut.work.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whut.work.base.model.Page;
import com.whut.work.user.dao.impl.UserDaoImpl;
import com.whut.work.user.model.User;
import com.whut.work.user.service.IUserService;

import java.util.HashMap;
import java.util.Map;

@Component
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserDaoImpl userDao;

	@Override
	public Page<User> getUserPageList(int currentPage, int pageSize) throws Exception {
		String queryHql = "from User u where u.id!=0 and u.isDelete=0";
		String countHql = "select count(*) from User u where u.id!=0 and u.isDelete=0";
		Page<User> returnPage = userDao.findPage(currentPage, pageSize, queryHql, countHql);
		
		return returnPage;                                 
	}

    @Override
    public Map<String, Object> delete(Integer id) throws Exception {
        Map<String,Object> returnMap = new HashMap<String,Object>();

        //String hql = "from User u where u.id='"+id+"'";
        User user = new User();
        try {
            user = userDao.getOne(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(user != null){
            user.setIsDelete(true);
            userDao.update(user);
            returnMap.put("message", "删除成功");
            returnMap.put("success", true);
            return returnMap;
        }else{
            returnMap.put("message", "删除失败");
            returnMap.put("success", false);
            return returnMap;
        }
    }

}
