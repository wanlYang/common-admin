package com.xieke.admin.mapper.pe;

import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.pe.PrivateContract;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ContractMapper {

    /**
     * 后台获取 私教合同列表
     * @param start
     * @param limit
     * @param name
     * @param phone
     * @return
     */
    List<PrivateContract> findAllByPageNameAndPhone(@Param("start") int start, @Param("limit") Integer limit, @Param("name") String name, @Param("phone") String phone);

    /**
     * 获取查询对应数量
     * @param name
     * @param phone
     * @return
     */
    int countByPageNameAndPhone(String name, String phone);

    /**
     * 添加私教合同
     * @param privateContract
     * @return
     */
    Integer insert(PrivateContract privateContract);


    /**
     * 根据ID查找合同
     * @param id
     * @return
     */
    PrivateContract findById(int id);

    /**
     * 根据私教合同编号获取合同信息
     * @param contractNumber
     * @return
     */
    PrivateContract findByContractNumber(String contractNumber);

    /**
     * 审核信息
     * @param id
     * @param checkDate
     * @param user
     * @return
     */
    Integer examine(@Param("id") String id, @Param("checkTime") Date checkDate, @Param("user") UserInfo user);

    List<PrivateContract> getContractByCustomerId(String id);

    /**
     * 获取教练的所有私教卡项
     * @param id
     * @return
     */
    List<PrivateContract> findContractByCoachId(Integer id);

    List<PrivateContract> findContractByCoachIdAndPhoneSearch(@Param("id") int id, @Param("string") String string);
    List<PrivateContract> findContractByCoachIdAndNameSearch(@Param("id") int id, @Param("string") String string);

    Integer deductionTimes(@Param("id") Integer id, @Param("deductionTimes") Integer deductionTimes);

    PrivateContract findOrderSimpleById(String id);
}
