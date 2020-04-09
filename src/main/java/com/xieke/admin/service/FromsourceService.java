package com.xieke.admin.service;

import com.xieke.admin.entity.Fromsource;

import java.util.List;

public interface FromsourceService {
    List<Fromsource> selectAllFromsource();

    int insertFromsource(Fromsource fromsource);

    int updateFromsorce(Fromsource fromsource);

    int deleteFromsorce(Integer id);

    List<Fromsource> getFromSourceTree();
}
