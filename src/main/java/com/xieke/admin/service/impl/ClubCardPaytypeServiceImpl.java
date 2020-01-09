package com.xieke.admin.service.impl;

import com.xieke.admin.entity.ClubCardPaytype;
import com.xieke.admin.mapper.ClubCardPaytypeMapper;
import com.xieke.admin.service.ClubCardPaytypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClubCardPaytypeServiceImpl implements ClubCardPaytypeService {

    @Autowired
    private ClubCardPaytypeMapper clubCardPaytypeMapper;

    /**
     * 创建会员卡和付款方式数据
     *
     * @param clubCardPaytype
     * @return
     */
    @Override
    public Integer insert(ClubCardPaytype clubCardPaytype) {


        return clubCardPaytypeMapper.insert(clubCardPaytype);
    }

    @Override
    public List<ClubCardPaytype> findByClubCardId(int id) {

        return clubCardPaytypeMapper.findByClubCardId(id);
    }

    @Override
    public Integer delByClubCardId(int id) {


        return clubCardPaytypeMapper.delByClubCardId(id);
    }
}
