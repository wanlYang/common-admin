package com.xieke.admin.service.timetable;


import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.timetable.StoreFront;
import com.xieke.admin.entity.timetable.TableCources;
import com.xieke.admin.entity.timetable.TableImages;
import com.xieke.admin.entity.timetable.Week;

import java.util.List;

public interface TableCourcesService {

	List<Week> getWeek();

	Result addCources(TableCources tableCources);

    List<List<TableCources>> getAllWeekCources(String id);

	List<TableCources> getAllWeekCources(String frontId, String weekId);

    Result editCources(TableCources tableCources);

    Result delete(String id);

	List<StoreFront> getAllWeekCourcesDay();

    List<StoreFront> getFront();


    Result addStore(StoreFront storeFront,String pessCode);

    Result editStore(StoreFront storeFront,String pessCode);

    List<List<List<TableCources>>> getAllWeekCourcesFront();

    boolean init(String StoreId);


    StoreFront getOneFront(String admin_id);

    StoreFront findStoreById(String store);

    Integer insertStoreForAdmin(String storeId, String adminId);

    void updateStoreForAdmin(String storeId, String adminId);

    List<TableImages> getImagesList(String admin_id);

    Integer addCourcesImages(TableImages tableImages);

    Integer deleteImages(String id);

    List<TableImages> getAllWeekCourcesDayImg();

    TableImages getImagesByStoreId(String code);
}
