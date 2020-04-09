package com.xieke.admin.entity.timetable;

import com.xieke.admin.entity.User;
import org.apache.ibatis.type.Alias;

import java.util.List;

/**
 * 门店
 * @author Administrator
 *
 */
@Alias("StoreFront")
public class StoreFront {
    
    //门店ID
    private String id;
    
    //门店名称
    private String name;

    private List<Week> weeks;

    private User user;


    public StoreFront() {
    }

    public StoreFront(String id) {
        this.id = id;
    }

    public StoreFront(String id, String name, List<Week> weeks) {
        this.id = id;
        this.name = name;
        this.weeks = weeks;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Week> getWeeks() {
        return weeks;
    }

    public void setWeeks(List<Week> weeks) {
        this.weeks = weeks;
    }

    @Override
    public String toString() {
        return "StoreFront{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", weeks=" + weeks +
                ", user=" + user +
                '}';
    }
}
