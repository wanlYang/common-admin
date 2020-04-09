package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Officetime;
import org.springframework.stereotype.Service;

import java.util.List;

public interface OfficetimeServer {

    List<Officetime> selectOfficetime(Integer page, Integer limit, Officetime officetime);


    Integer countOfficetime();

    Integer updateOfficetime(Officetime officetime);

    Integer insertOfficetime(Officetime officetime);

    Integer delOfficetime(Officetime officetime);

    List<Officetime> selectOfficetimeAll();
}
