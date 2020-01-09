package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.ContractPaytype;
import com.xieke.admin.mapper.pe.ContractPaytypeMapper;
import com.xieke.admin.service.pe.ContractPaytypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContractPaytypeServiceImpl implements ContractPaytypeService {

    @Autowired
    private ContractPaytypeMapper contractPaytypeMapper;
    /**
     * 添加私教合同付款方式
     *
     * @param contractPaytype
     */
    @Override
    public int insert(ContractPaytype contractPaytype) {


        return contractPaytypeMapper.insert(contractPaytype);
    }
}
