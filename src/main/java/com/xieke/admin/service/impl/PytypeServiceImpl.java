package com.xieke.admin.service.impl;

import com.xieke.admin.entity.Paytype;
import com.xieke.admin.mapper.PaytypeMapper;
import com.xieke.admin.service.PaytypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class PytypeServiceImpl implements PaytypeService {

    @Resource
    private PaytypeMapper paytypeMapper;

    @Override
    public List<Paytype> selectAllPaytype(int limit,int page) {
        return paytypeMapper.selectAllPaytype((page-1)*limit,limit);
    }

    @Override
    public boolean insertPaytype(Paytype paytype) {
        return paytypeMapper.insertPaytype(paytype);
    }

    @Override
    public boolean deletePaytype(int id) {
        return paytypeMapper.deletePaytype(id);
    }

    @Override
    public boolean updatePaytype(Paytype paytype) {
        return paytypeMapper.updatePaytype(paytype);
    }

    @Override
    public int countPaytype() {
        return paytypeMapper.countPaytype();
    }

    @Override
    public List<Paytype> selectAllPaytype() {

        return paytypeMapper.findAll();
    }

    @Override
    public Paytype findById(Integer paytypeId) {
        return paytypeMapper.findById(paytypeId);
    }
}
