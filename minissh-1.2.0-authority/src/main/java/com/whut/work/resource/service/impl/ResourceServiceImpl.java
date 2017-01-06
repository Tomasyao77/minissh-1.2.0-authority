package com.whut.work.resource.service.impl;

import com.whut.work.base.model.Page;
import com.whut.work.resource.dao.impl.ResourceDaoImpl;
import com.whut.work.resource.dao.impl.RoleResourceDaoImpl;
import com.whut.work.resource.model.Resource;
import com.whut.work.resource.service.IResourceService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * Created by zouyao on 2017/1/6.
 */
public class ResourceServiceImpl implements IResourceService {

    @Autowired
    private ResourceDaoImpl resourceDao;
    @Autowired
    private RoleResourceDaoImpl rrDao;

    @Override
    public Page<Resource> getResourcePageList(int currentPage, int pageSize) throws Exception {
        String queryHql = " from Resource r where r.id!=0 ";
        String countHql = " select count(*) from Resource r where r.id!=0 ";
        Page<Resource> returnPage = resourceDao.findPage(currentPage, pageSize, queryHql, countHql);

        return returnPage;
    }

    @Override
    public Page<Resource> getResourcePageListForSearch(int currentPage, int pageSize, String blurResourceName) throws Exception {
        String queryHql = " from Resource r where r.id!=0 and r.name like '%"+blurResourceName+"%' ";
        String countHql = " select count(*) from Resource r where r.id!=0 and r.name like '%"+blurResourceName +"%' ";
        Page<Resource> returnPage = resourceDao.findPage(currentPage, pageSize, queryHql, countHql);

        return returnPage;
    }

    @Override
    public Map<String, Object> addResource(String resourceName) throws Exception {
        return null;
    }

    @Override
    public Map<String, Object> deleteOneResource(Integer id) throws Exception {
        return null;
    }

    @Override
    public Map<String, Object> editOneResource(Integer id, String resourceName) throws Exception {
        return null;
    }

}
