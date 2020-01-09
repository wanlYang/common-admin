package com.xieke.admin.service.impl;

import com.xieke.admin.entity.Integral;
import com.xieke.admin.mapper.IntegralMapper;
import com.xieke.admin.service.IntegralService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class IntegralServiceImpl implements IntegralService {
    @Resource
    private IntegralMapper integralMapper;
    @Override
    public List<Integral> selectAllIntegral() {
        return integralMapper.selectAllIntegral();
    }

    @Override
    public int insertIntegral(Integral integral) {
        return integralMapper.insertIntegral(integral);
    }

    @Override
    public int updateIntegral(Integral integral) {
        return integralMapper.updateIntegral(integral);
    }

    @Override
    public int deleteIntegral(int id) {
        return integralMapper.deleteIntegral(id);
    }

    @Override
    public Integral getByClubCardNum(String menmbercardNumber) {


        return integralMapper.findByClubCardNum(menmbercardNumber);
    }

    @Override
    public Integer deleteIntegralByClubCardNum(String clubCardNum) {
        return integralMapper.deleteIntegralByClubCardNum(clubCardNum);
    }

}
