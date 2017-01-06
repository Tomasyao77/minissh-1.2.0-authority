package com.whut.work.resource.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.resource.dao.IResourceDao;
import com.whut.work.resource.model.Resource;
import org.springframework.stereotype.Component;

/**
 * Created by zouy on 2016/12/23.
 */
@Component
public class ResourceDaoImpl extends BaseDaoImpl<Resource> implements IResourceDao {

    public ResourceDaoImpl(){
        super(Resource.class);
    }
}
