package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.PrivateContract;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
}
