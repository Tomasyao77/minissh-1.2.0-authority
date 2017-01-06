package com.whut.work.resource.model;

import javax.persistence.*;

/**
 * Created by zouy on 2016/12/23.
 */
@Entity
@Table(name="role_resource")
public class RoleResource {

    @Id
    @GeneratedValue
    private Integer id;
    @Column(name="role_id")
    private Integer roleId;
    @Column(name="resource_id")
    private Integer resourceId;

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

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }
}
