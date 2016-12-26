package com.whut.work.user.vo;

/**
 * Created by zouyao on 2016/12/26.
 */
public class UserVo {
    private Integer id;
    private String username;
    private String tel;
    private String email;

    public UserVo(){}
    public UserVo(Integer id,String username,String tel,String email){
        this.id = id;
        this.username = username;
        this.tel = tel;
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
