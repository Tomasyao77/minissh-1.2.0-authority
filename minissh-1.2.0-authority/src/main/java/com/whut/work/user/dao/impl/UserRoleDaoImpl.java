package com.whut.work.user.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.user.dao.IUserRoleDao;
import com.whut.work.user.model.UserRole;
import org.springframework.stereotype.Component;

/**
 * Created by zouyao on 2016/12/25.
 */
@Component
public class UserRoleDaoImpl extends BaseDaoImpl<UserRole> implements IUserRoleDao {

    public UserRoleDaoImpl(){
        super(UserRole.class);
    }

}
