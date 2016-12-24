package com.whut.work.file.dao.impl;

import com.whut.work.base.dao.Impl.BaseDaoImpl;
import com.whut.work.file.dao.IFilesDao;
import com.whut.work.file.model.Files;

/**
 * Created by zouy on 2016/12/23.
 */
public class FilesDaoImpl extends BaseDaoImpl<Files> implements IFilesDao {
    public FilesDaoImpl(){
        super(Files.class);
    }

}
