package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.ClubCardPaytype;
import com.xieke.admin.entity.pe.ContractPaytype;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContractPaytypeMapper {
    Integer insert(ContractPaytype contractPaytype);

    List<ContractPaytype> findByContractId(int id);

    Integer delByContractId(int id);

}
