package com.whut.work.resource.service;

import com.whut.work.base.model.Page;
import com.whut.work.resource.model.Resource;

import java.util.Map;

/**
 * Created by zouyao on 2017/1/6.
 */
public interface IResourceService {

    //获取资源分页列表
    public Page<Resource> getResourcePageList(int currentPage, int pageSize) throws Exception;

    //获取资源分页列表ForSearch
    public Page<Resource> getResourcePageListForSearch(int currentPage, int pageSize,String blurResourceName) throws Exception;

    //新增资源
    public Map<String,Object> addResource(String resourceName) throws Exception;

    //删除资源
    public Map<String,Object> deleteOneResource(Integer id) throws Exception;

    //编辑资源
    public Map<String,Object> editOneResource(Integer id,String resourceName) throws Exception;

}
