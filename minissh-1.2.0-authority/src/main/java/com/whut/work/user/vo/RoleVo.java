package com.whut.work.user.vo;

/**
 * Created by zouyao on 2016/12/25.
 */
public class RoleVo {

    private Integer id;
    private String roleName;

    public RoleVo(){

    }

    public RoleVo(Integer id,String roleName){
        this.id = id;
        this.roleName = roleName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
