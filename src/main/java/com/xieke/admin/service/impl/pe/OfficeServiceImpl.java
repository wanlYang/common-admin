package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Office;
import com.xieke.admin.entity.pe.Order;
import com.xieke.admin.mapper.pe.OfficeMapper;
import com.xieke.admin.service.pe.OfficeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class OfficeServiceImpl implements OfficeService {

    @Resource
    private OfficeMapper officeMapper;

    @Override
    public List<Office> selectOffice() {
        return officeMapper.selectOddice();
    }

    @Override
    public List<Office> deleteOffice(Office office) {
        return officeMapper.deleteOffice(office);
    }

    @Override
    public List<Office> getAllOffice() {
        return officeMapper.getAllOffice();
    }

    @Override
    public Office getOfficeByCoachId(int id) {


        return officeMapper.getOfficeByCoachId(id);
    }

    @Override
    public Integer addOffice(Office office) {


        return officeMapper.createOffice(office);
    }
}
