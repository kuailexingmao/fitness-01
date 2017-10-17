package org.zyj.service;

import org.zyj.utils.DataGrid;
import org.zyj.vo.Clazz;

/**
 * Created by zyj on 2017/10/12.
 */
public interface ClazzService {

    DataGrid<Clazz> getListClazz(Integer page, Integer rows);

    void deleteClazz(Integer eid);

    Clazz findClazzByCid(Integer cid);

    void updateClazz(Clazz clazz);

    void addClazz(Clazz clazz);
}
