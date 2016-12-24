package com.whut.work.resources.model;

import javax.persistence.*;

/**
 * Created by zouy on 2016/12/23.
 */
@Entity
@Table(name="rolelist_resources")
public class RoleResources {

    @Id
    @GeneratedValue
    private Integer id;
    @Column(name="rolelist_id")
    private Integer roleId;
    @Column(name="resources_id")
    private Integer resourcesId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getResourcesId() {
        return resourcesId;
    }

    public void setResourcesId(Integer resourcesId) {
        this.resourcesId = resourcesId;
    }
}
