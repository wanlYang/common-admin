package com.xieke.admin.service.impl;

import com.xieke.admin.entity.Cardsetting;
import com.xieke.admin.mapper.CardsettingMapper;
import com.xieke.admin.service.CardsettingService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CardsettingServiceImpl implements CardsettingService {

    @Resource
    private CardsettingMapper cardsettingMapper;
    @Override
    public boolean insertCardsetting(Cardsetting cardsetting) {
        return cardsettingMapper.insertCardsetting(cardsetting);
    }

    @Override
    public boolean deleteCardsetting(int id) {
        return cardsettingMapper.deleteCardsetting(id);
    }

    @Override
    public List<Cardsetting> selectAllCardsteting() {
        return cardsettingMapper.selectAllCardsetting();
    }

    @Override
    public boolean updateCardsetting(Cardsetting cardsetting) {
        return cardsettingMapper.updateCardsetting(cardsetting);
    }

    @Override
    public int countCardsetting() {
        return cardsettingMapper.countCardsetting();
    }

    @Override
    public Cardsetting get(Integer id) {


        return cardsettingMapper.findById(id);
    }
}
