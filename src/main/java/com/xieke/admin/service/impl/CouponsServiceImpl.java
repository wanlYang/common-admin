package com.xieke.admin.service.impl;

import com.aliyuncs.exceptions.ClientException;
import com.xieke.admin.entity.Acuser;
import com.xieke.admin.entity.Coupons;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.UserCou;
import com.xieke.admin.mapper.AcuserMapper;
import com.xieke.admin.mapper.CouponsMapper;
import com.xieke.admin.service.CouponsService;
import com.xieke.admin.util.MessageUtil;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CouponsServiceImpl implements CouponsService {

    @Autowired
    private CouponsMapper couponsMapper;

    @Autowired
    private AcuserMapper acuserMapper;

    @Override
    public Coupons findById(int id) {
        return couponsMapper.findById(id);
    }

    @Override
    public UserCou findUserAndCou(String userId, String couponId) {

        return couponsMapper.findByUserAndCou(userId,couponId);
    }

    @Override
    public List<UserCou> selectUserCouByUserId(String userId) {
        return couponsMapper.selectUserCouByUserId(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result examine(String id, String coupons) throws ClientException {

        String[] coupons_ = coupons.split(",");
        List<Coupons> coupons_arr = new ArrayList<>();
        for (String cid: coupons_) {
            Coupons byId = couponsMapper.findById(Integer.parseInt(cid));
            coupons_arr.add(byId);
        }
        for (Coupons couponsEntity: coupons_arr) {
            UserCou byUserAndCou = couponsMapper.findByUserAndCou(id, String.valueOf(couponsEntity.getId()));
            if (byUserAndCou != null){
                couponsMapper.updateState(String.valueOf(byUserAndCou.getId()),1);
            }else{
                UserCou userCou = new UserCou();
                userCou.setAcuser(acuserMapper.findById(id));
                userCou.setCoupons(couponsEntity);
                userCou.setState(1);
                couponsMapper.create(userCou);
            }
        }
        Acuser byId = acuserMapper.findById(id);
        return new Result(200,"审核成功!");
    }

    @Override
    public Result reverse(String userId) {
        couponsMapper.updateStateByUserId(userId,0);
        return new Result(200,"反审核成功!");
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result insert(int id) {
        UserCou byUserAndCou_04 = couponsMapper.findByUserAndCou(String.valueOf(id), "1");
        if (byUserAndCou_04 == null){
            Coupons byId = couponsMapper.findById(1);
            UserCou userCou = new UserCou();
            userCou.setAcuser(acuserMapper.findById(String.valueOf(id)));
            userCou.setCoupons(byId);
            userCou.setState(0);
            couponsMapper.create(userCou);
        }
        return new Result(200,"成功!");
    }
}
