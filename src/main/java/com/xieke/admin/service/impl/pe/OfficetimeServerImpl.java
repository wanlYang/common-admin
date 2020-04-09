package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Officetime;
import com.xieke.admin.mapper.pe.OfficetimeMapper;
import com.xieke.admin.service.pe.OfficetimeServer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class OfficetimeServerImpl implements OfficetimeServer {

    @Resource
    private OfficetimeMapper officetimeMapper;

    @Override
    public List<Officetime> selectOfficetime(Integer page, Integer limit,Officetime officetime) {
       return  officetimeMapper.selectOfficetime((page-1)*limit,limit,officetime);
    }

    @Override
    public Integer countOfficetime() {
        return officetimeMapper.countOfficetime();
    }

    @Override
    public Integer updateOfficetime(Officetime officetime) {
        return officetimeMapper.updateOfficetime(officetime);
    }

    @Override
    public Integer insertOfficetime(Officetime officetime) {
        return officetimeMapper.insertOfficetime(officetime);
    }

    @Override
    public Integer delOfficetime(Officetime officetime) {
        return officetimeMapper.delOfficetime(officetime);
    }

    @Override
    public List<Officetime> selectOfficetimeAll() {


        return officetimeMapper.selectOfficetimeAll();
    }
}
