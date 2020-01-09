package com.xieke.admin.service.impl;

import com.xieke.admin.entity.Clubcard;
import com.xieke.admin.entity.Firstmoney;
import com.xieke.admin.mapper.FirstmoneyMapper;
import com.xieke.admin.service.FirstmoneyService;
import com.xieke.admin.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class FirstmoneyServiceImpl implements FirstmoneyService {

    @Resource
    private FirstmoneyMapper firstmoneyMapper;

    @Override
    public List<Firstmoney> selectAllFirstmoney() {
        return firstmoneyMapper.selectAllFirstmoney();
    }

    @Override
    public int insertFirstmoney(Firstmoney firstmoney) {
        String firstNum = UUIDUtils.generateNumberUUID("FIRSTMONEY");
        firstmoney.setNumber(firstNum);
        firstmoney.setPayTime(new Date());
        return firstmoneyMapper.insertFirstmoney(firstmoney);
    }

    @Override
    public int updateFirstmoney(Firstmoney firstmoney) {
        return firstmoneyMapper.updateFirstmoney(firstmoney);
    }

    @Override
    public int deleteFirstmoney(int id) {
        return firstmoneyMapper.deleteFirstmoney(id);
    }

    @Override
    public List<Firstmoney> getAll(Integer page, Integer limit, String name, String phone) {
        List<Firstmoney> firstmonies = null;
        if (page != null && limit != null) {
            firstmonies = this.firstmoneyMapper.findAllListByPage((page - 1) * limit, limit,name,phone);
        }
        return firstmonies == null ? null : firstmonies;
    }

    @Override
    public Firstmoney getFirstMoneyInfo(String number) {


        return firstmoneyMapper.findByNumber(number);
    }

    @Override
    public List<Firstmoney> getAll(Integer page, Integer limit, String name, String phone, String customer_id) {
        List<Firstmoney> firstmonies = null;
        if (page != null && limit != null) {
            firstmonies = this.firstmoneyMapper.findAllListByPageByCustomerId((page - 1) * limit, limit,name,phone,customer_id);
        }
        return firstmonies;
    }

    @Override
    public Firstmoney getFirstMoneyInfoByCustId(String firstmoneyId) {


        return firstmoneyMapper.findById(firstmoneyId);
    }
}
