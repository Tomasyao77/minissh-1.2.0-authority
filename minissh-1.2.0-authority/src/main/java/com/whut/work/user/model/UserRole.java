package com.whut.work.user.model;

import javax.persistence.*;

/**
 * Created by zouy on 2016/12/23.
 */
@Entity
@Table(name="userlist_rolelist")
public class UserRole {

    @Id
    @GeneratedValue
    private Integer id;
    @Column(name="userlist_id")
    private Integer userId;
    @Column(name="rolelist_id")
    private Integer roleId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
