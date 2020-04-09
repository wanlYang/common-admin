package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Office;
import com.xieke.admin.entity.pe.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface OfficeMapper {

    List<Office> selectOddice();

    List<Office> deleteOffice(Office office);

    List<Office> getAllOffice();

    Office getOfficeByCoachId(int id);

    Integer createOffice(Office office);
}
