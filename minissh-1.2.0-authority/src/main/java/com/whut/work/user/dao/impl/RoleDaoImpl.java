package com.whut.work.user.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.user.dao.IRoleDao;
import com.whut.work.user.model.Role;
import org.springframework.stereotype.Component;

/**
 * Created by zouyao on 2016/12/24.
 */
@Component
public class RoleDaoImpl extends BaseDaoImpl<Role> implements IRoleDao {

    public RoleDaoImpl(){
        super(Role.class);
    }

}
