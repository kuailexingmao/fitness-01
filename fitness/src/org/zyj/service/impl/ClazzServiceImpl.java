package org.zyj.service.impl;

import org.springframework.stereotype.Service;
import org.zyj.dao.ClazzMapper;
import org.zyj.service.ClazzService;
import org.zyj.utisl.DataGrid;
import org.zyj.vo.Clazz;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zyj on 2017/10/12.
 */
@Service
public class ClazzServiceImpl implements ClazzService {

    @Resource
    private ClazzMapper clazzMapperDao;

    @Override
    public DataGrid<Clazz> getListClazz(Integer page, Integer rows) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("start",(page-1)*rows);
        map.put("size",rows);
        List<Clazz> listClazz = clazzMapperDao.getListClazz(map);
        return null;
    }

    @Override
    public void deleteClazz(Integer eid) {

    }

    @Override
    public Clazz findClazzByCid(Integer cid) {
        return null;
    }

    @Override
    public void updateClazz(Clazz clazz) {

    }

    @Override
    public void addClazz(Clazz clazz) {

    }
}
