package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.ContractPaytype;

public interface ContractPaytypeService {
    /**
     * 添加私教合同付款方式
     * @param contractPaytype
     */
    int insert(ContractPaytype contractPaytype);
}
