package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Shopping;
import com.xieke.admin.mapper.pe.ShoppingMapper;
import com.xieke.admin.service.pe.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ShoppingServiceImpl implements ShoppingService {

    @Autowired
    private ShoppingMapper shoppingMapper;

    @Override
    public int insert(Shopping shopping) {
        return shoppingMapper.insert(shopping);
    }

    @Override
    public Shopping findById(String id) {
        return shoppingMapper.findById(id);
    }

    @Override
    public List<Shopping> findByContractId(String id) {
        return shoppingMapper.findByContractId(id);
    }

    @Override
    public List<Shopping> findByCustomerId(String id) {
        return shoppingMapper.findByCustomerId(id);
    }

    @Override
    public int delShoppById(String id) {
        return shoppingMapper.delShoppById(id);
    }

    @Override
    public List<Shopping> findByCoachId(int id, Date thisTime) {


        return shoppingMapper.findByCoachId(id,thisTime);
    }
}
