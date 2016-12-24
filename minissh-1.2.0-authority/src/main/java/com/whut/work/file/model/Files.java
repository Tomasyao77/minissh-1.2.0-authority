package com.whut.work.file.model;

import javax.persistence.*;

/**
 * Created by zouy on 2016/12/23.
 */
@Entity
@Table(name="files")
public class Files {

    @Id
    @GeneratedValue
    private Integer id;
    @Column(name="filename")
    private String fileName;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
