package com.xieke.admin.service.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.PrivateContract;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 私教合同管理
 */
public interface ContractService {

    /**
     * 后台获取私教合同信息列表
     * @param page
     * @param limit
     * @param name
     * @param phone
     * @return
     */
    List<PrivateContract> selectAll(@Param("page") Integer page, @Param("limit") Integer limit, @Param("name") String name, @Param("phone") String phone);

    /**
     *
     * @return
     */
    int count(String name,String phone);

    /**
     * 添加私教合同
     * @param privateContract
     * @param paytypeIds
     * @param paytypeMonies
     * @param firstmoneyId
     * @return
     */
    Result createClubCard(PrivateContract privateContract, Integer[] paytypeIds, Double[] paytypeMonies, String firstmoneyId);

    /**
     * 根据私教合同编号获取合同信息
     * @param contractNumber
     * @return
     */
    PrivateContract getContractInfo(String contractNumber);

    /**
     * 审核私教合同信息
     * @param id
     * @return
     */
    Integer examine(String id);

    List<PrivateContract> getContractByCustomerId(String id);

    PrivateContract findById(String id);
}
