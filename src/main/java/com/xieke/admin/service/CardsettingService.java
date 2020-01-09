package com.xieke.admin.service;

import com.xieke.admin.entity.Cardsetting;

import java.util.List;

public interface CardsettingService {
    boolean insertCardsetting(Cardsetting cardsetting);

    boolean deleteCardsetting(int id);

    List<Cardsetting> selectAllCardsteting();

    boolean updateCardsetting(Cardsetting cardsetting);

    int countCardsetting();

    Cardsetting get(Integer id);
}
