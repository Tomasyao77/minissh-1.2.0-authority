package com.whut.work.resources.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.resources.dao.IResourcesDao;
import com.whut.work.resources.model.Resources;
import org.springframework.stereotype.Component;

/**
 * Created by zouy on 2016/12/23.
 */
@Component
public class ResourcesDaoImpl extends BaseDaoImpl<Resources> implements IResourcesDao {

    public ResourcesDaoImpl(){
        super(Resources.class);
    }
}
