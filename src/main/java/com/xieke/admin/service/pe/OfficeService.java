package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Office;
import com.xieke.admin.entity.pe.Order;

import java.util.List;

public interface OfficeService {

    List<Office> selectOffice();

    List<Office> deleteOffice(Office office);

    List<Office> getAllOffice();

    Office getOfficeByCoachId(int id);

    Integer addOffice(Office office);
}
