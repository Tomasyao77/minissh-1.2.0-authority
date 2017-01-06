package com.whut.work.resource.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by zouy on 2016/12/23.
 */
@Entity
@Table(name="resource")
public class Resource {

    @Id
    @GeneratedValue
    private Integer id;
    private String name;
    @Column(name = "create_time")
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
