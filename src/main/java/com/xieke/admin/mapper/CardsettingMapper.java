package com.xieke.admin.mapper;

import com.xieke.admin.entity.Cardsetting;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CardsettingMapper {
    boolean insertCardsetting(Cardsetting cardsetting);

    boolean deleteCardsetting(int id);

    List<Cardsetting> selectAllCardsetting();

    boolean updateCardsetting(Cardsetting cardsetting);

    int countCardsetting();

    Cardsetting findById(Integer id);
}
