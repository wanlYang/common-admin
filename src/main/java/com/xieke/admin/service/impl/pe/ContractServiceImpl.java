package com.xieke.admin.service.impl.pe;

import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.ClubCardPaytype;
import com.xieke.admin.entity.Firstmoney;
import com.xieke.admin.entity.Integral;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.ContractPaytype;
import com.xieke.admin.entity.pe.PrivateContract;
import com.xieke.admin.mapper.pe.ContractMapper;
import com.xieke.admin.service.CustomerService;
import com.xieke.admin.service.FirstmoneyService;
import com.xieke.admin.service.IntegralService;
import com.xieke.admin.service.PaytypeService;
import com.xieke.admin.service.pe.ContractPaytypeService;
import com.xieke.admin.service.pe.ContractService;
import com.xieke.admin.util.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractMapper contractMapper;

    @Autowired
    private IntegralService integralService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private FirstmoneyService firstmoneyService;


    @Autowired
    private PaytypeService paytypeService;

    @Autowired
    private ContractPaytypeService contractPaytypeService;
    /**
     * 后台获取私教合同信息列表
     *
     * @param page
     * @param limit
     * @param name
     * @param phone
     * @return
     */
    @Override
    public List<PrivateContract> selectAll(Integer page, Integer limit, String name, String phone) {

        return contractMapper.findAllByPageNameAndPhone((page - 1) * limit, limit,name,phone);
    }

    /**
     * @param name
     * @param phone
     * @return
     */
    @Override
    public int count(String name, String phone) {


        return contractMapper.countByPageNameAndPhone(name,phone);
    }

    /**
     * 添加私教合同
     *
     * @param privateContract
     * @param paytypeIds
     * @param paytypeMonies
     * @param firstmoneyId
     * @return
     */
    @Override
    public Result createClubCard(PrivateContract privateContract, Integer[] paytypeIds, Double[] paytypeMonies, String firstmoneyId) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        privateContract.setOperator(userInfo);
        privateContract.setCreateTime(new Date());
        String contractNumber = UUIDUtils.generateNumberUUID("COACH");
        privateContract.setContractNumber(contractNumber);
        privateContract.setAuditStatus(0);
        privateContract.setStatus(0);
        privateContract.setPostponement(0);
        privateContract.setPresentationPoints(privateContract.getPresentationPoints() == null ? 0 : privateContract.getPresentationPoints());
        privateContract.setResidualTimes(privateContract.getTotalNumber());
        privateContract.setPayfor(arrSum(paytypeMonies).toString());
        Integer row = contractMapper.insert(privateContract);
        Integral integral_ = new Integral();
        integral_.setAmount(privateContract.getPresentationPoints() == null ? 0 : privateContract.getPresentationPoints());
        integral_.setCustomer(privateContract.getCustomer());
        integral_.setInsertTime(new Date());
        integral_.setClubcardNum(contractNumber);
        Integer IntRow = integralService.insertIntegral(integral_);
        customerService.updateState(privateContract.getCustomer().getId(),1);
        for (int i = 0; i < paytypeIds.length; i++) {

            if (paytypeIds[i] == 11){
                ContractPaytype contractPaytype = new ContractPaytype();
                contractPaytype.setPrivateContract(privateContract);
                Firstmoney firstmoney = firstmoneyService.getFirstMoneyInfoByCustId(firstmoneyId);
                firstmoney.setStatus(1);
                firstmoneyService.updateFirstmoney(firstmoney);
                contractPaytype.setPaytype(paytypeService.findById(paytypeIds[i]));
                contractPaytype.setMoney(String.valueOf(paytypeMonies[i]));
                contractPaytypeService.insert(contractPaytype);
            }else{
                ContractPaytype contractPaytype = new ContractPaytype();
                contractPaytype.setPrivateContract(privateContract);
                contractPaytype.setPaytype(paytypeService.findById(paytypeIds[i]));
                contractPaytype.setMoney(String.valueOf(paytypeMonies[i]));
                contractPaytypeService.insert(contractPaytype);
            }
        }

        return new Result(200,"添加成功");
    }

    /**
     * 根据私教合同编号获取合同信息
     *
     * @param contractNumber
     * @return
     */
    @Override
    public PrivateContract getContractInfo(String contractNumber) {


        return contractMapper.findByContractNumber(contractNumber);
    }

    public static Double arrSum(Double[] arr) {
        Double temp = 0.00;
        for (int i = 0; i < arr.length; i++) {
            temp += arr[i];
        }
        return temp;
    }

    /**
     * 审核私教合同信息
     *
     * @param id
     * @return
     */
    @Override
    public Integer examine(String id) {

        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();

        return contractMapper.examine(id,new Date(),userInfo);
    }

    @Override
    public List<PrivateContract> getContractByCustomerId(String id) {
        return contractMapper.getContractByCustomerId(id);
    }

    @Override
    public PrivateContract findById(String id) {
        return contractMapper.findById(Integer.valueOf(id));
    }

    /**
     * 获取教练的全部私教卡项
     *
     * @return
     */
    @Override
    public List<PrivateContract> findContractByCoachId(Integer id) {


        return contractMapper.findContractByCoachId(id);
    }
}
