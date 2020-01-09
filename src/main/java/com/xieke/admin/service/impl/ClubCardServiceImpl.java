package com.xieke.admin.service.impl;

import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.*;
import com.xieke.admin.mapper.ClubCardMapper;
import com.xieke.admin.service.*;
import com.xieke.admin.util.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class ClubCardServiceImpl implements ClubCardService {

    @Autowired
    private ClubCardMapper clubCardMapper;

    @Autowired
    private IntegralService integralService;
    @Autowired
    private ClubCardPaytypeService clubCardPaytypeService;

    @Autowired
    private PaytypeService paytypeService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private FirstmoneyService firstmoneyService;




    /**
     * 获取会员卡列表
     *
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<Clubcard> getAllClubCard(Integer page, Integer limit,String name,String phone) {
        List<Clubcard> clubcards = null;
        if (page != null && limit != null) {
            clubcards = this.clubCardMapper.findAllListByPage((page - 1) * limit, limit,name,phone);
        }
        return clubcards;
    }

    /**
     * 获取所有数量
     *
     * @return
     */
    @Override
    public Integer getAllCount() {
        return clubCardMapper.count();
    }

    /**
     * 添加会员卡项
     *
     * @param clubcard
     * @param paytypeIds
     * @param paytypeMonies
     * @param integral
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result createClubCard(Clubcard clubcard, Integer[] paytypeIds, Double[] paytypeMonies, Integer integral,String firstmoneyId) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        clubcard.setCreateUser(userInfo);
        clubcard.setCareteTime(new Date());
        clubcard.setPaytype(paytypeService.findById(paytypeIds[0]));
        String clubcardNum = UUIDUtils.generateNumberUUID("CLUBCARD");
        clubcard.setMenmbercardNumber(clubcardNum);
        clubcard.setPayfor(arrSum(paytypeMonies));
        clubcard.setExamine(0);
        Integer clubRow = clubCardMapper.insert(clubcard);
        Integral integral_ = new Integral();
        integral_.setAmount(integral == null ? 0 : integral);
        integral_.setCustomer(clubcard.getCustomer());
        integral_.setInsertTime(new Date());
        integral_.setClubcardNum(clubcardNum);
        Integer IntRow = integralService.insertIntegral(integral_);
        customerService.updateState(clubcard.getCustomer().getId(),1);
        for (int i = 0; i < paytypeIds.length; i++) {
            if (paytypeIds[i] == 11){
                ClubCardPaytype clubCardPaytype = new ClubCardPaytype();
                clubCardPaytype.setClubcard(clubcard);
                Firstmoney firstmoney = firstmoneyService.getFirstMoneyInfoByCustId(firstmoneyId);
                firstmoney.setStatus(1);
                firstmoneyService.updateFirstmoney(firstmoney);
                clubCardPaytype.setPaytype(paytypeService.findById(paytypeIds[i]));
                clubCardPaytype.setMoney(paytypeMonies[i]);
                clubCardPaytypeService.insert(clubCardPaytype);
            }else{
                ClubCardPaytype clubCardPaytype = new ClubCardPaytype();
                clubCardPaytype.setClubcard(clubcard);
                clubCardPaytype.setPaytype(paytypeService.findById(paytypeIds[i]));
                clubCardPaytype.setMoney(paytypeMonies[i]);
                clubCardPaytypeService.insert(clubCardPaytype);
            }


        }
        return new Result(200,"添加成功");
    }

    public static Double arrSum(Double[] arr) {
        Double temp = 0.00;
        for (int i = 0; i < arr.length; i++) {
            temp += arr[i];
        }
        return temp;
    }

    /**
     * 打印会员卡获取会员卡信息
     *
     * @param clubcardNum
     * @return
     */
    @Override
    public Clubcard getClubCardInfo(String clubcardNum) {


        return clubCardMapper.findByClubcardNum(clubcardNum);
    }

    /**
     * 审核会员卡信息
     *
     * @param id
     * @return
     */
    @Override
    public Integer examine(String id) {
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        return clubCardMapper.examine(id,new Date(),userInfo);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result delClubCard(String id) {
        Clubcard clubcard = clubCardMapper.findById(Integer.valueOf(id));
        if (clubcard == null){
            return new Result(-1,"数据有误!");
        }
        integralService.deleteIntegralByClubCardNum(clubcard.getMenmbercardNumber());
        clubCardPaytypeService.delByClubCardId(clubcard.getId());
        clubCardMapper.deleteById(id);
        return new Result(200,"删除成功!");
    }

    @Override
    public Result updateClubCard(Clubcard clubcard) {
        Clubcard clubcard_ = clubCardMapper.findById(clubcard.getId());
        if (clubcard_ == null){
            return new Result(-1,"数据有误!");
        }
        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        clubcard.setUpdateUser(userInfo);
        clubcard.setUpdateTime(new Date());
        clubCardMapper.update(clubcard);
        return new Result(200,"修改成功!");
    }
}
