package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.ContractPaytype;

import java.util.List;

public interface ContractPaytypeService {
    /**
     * 添加私教合同付款方式
     * @param contractPaytype
     */
    int insert(ContractPaytype contractPaytype);

    /**
     * 根据合同ID获取合同对应付款方式
     * @param id
     * @return
     */
    List<ContractPaytype> findByContractId(Integer id);
}
