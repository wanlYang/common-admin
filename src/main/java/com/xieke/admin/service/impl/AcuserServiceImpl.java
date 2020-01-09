package com.xieke.admin.service.impl;

import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.entity.Acuser;
import com.xieke.admin.entity.Gift;
import com.xieke.admin.mapper.AcuserMapper;
import com.xieke.admin.service.AcuserService;
import com.xieke.admin.service.CouponsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AcuserServiceImpl implements AcuserService {

    @Autowired
    private AcuserMapper acuserMapper;

    @Autowired
    private CouponsService couponsService;

    @Override
    public List<Acuser> selectAllAcuser(int limit, int page,String name,String phone) {
        List<Acuser> acusers = acuserMapper.selectAllAcuser(limit, (page - 1) * limit, name, phone);
        for (Acuser a:acusers) {
            a.setUserCous(couponsService.selectUserCouByUserId(String.valueOf(a.getId())));
        }
        return acusers;
    }

    @Override
    public int countAcuser(String name,String phone) {
        return acuserMapper.countAcuser(name,phone);
    }

    @Override
    public Integer insertAcuser(Acuser acuser) {
        Integer integer = acuserMapper.insertAcuser(acuser);
        couponsService.insert(acuser.getId());
        return integer;
    }

    @Override
    public Acuser findByPhone(String phone) {
        return acuserMapper.findByPhone(phone);
    }

    @Override
    public List<Acuser> selectUsableAcuser(int limit, int page, String name, String phone) {

        return acuserMapper.selectUsableAcuser(limit,(page-1)*limit,name,phone);
    }

    @Override
    public int countUsableAcuser(String name, String phone) {
        return acuserMapper.countUsableAcuser(name,phone);
    }

    /**
     * 设定中奖用户
     *
     * @param acuser
     * @return
     */
    @Override
    public Integer insertWinnerAcuser(Acuser acuser) {
        acuserMapper.deleteWinnerAcuser();
        return acuserMapper.insertWinnerAcuser(acuser);
    }

    /**
     * 获取设定
     *
     * @return
     */
    @Override
    public List<Acuser> selectWinnerAcuser() {


        return acuserMapper.selectWinnerAcuser();
    }

    /**
     * 删除设定
     *
     * @return
     */
    @Override
    public Integer delWinnerAcuser() {


        return acuserMapper.deleteWinnerAcuser();
    }

    /**
     * 记录中奖人
     *
     * @param gift
     * @return
     */
    @Override
    public Integer insertGift(Gift gift) {


        return acuserMapper.insertGift(gift);
    }
}
