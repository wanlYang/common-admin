package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.util.List;

/**
 * 来源  实体
 */
@Alias("Fromsource")
public class Fromsource {

    /**
     * 来源ID
     */
    private int id;

    /**
     * 名称
     */
    private String name;

    private List<Fromsource> children;

    /**
     * parent_id 父级ID 关联本表
     */
    private Integer  parentId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Fromsource> getChildren() {
        return children;
    }

    public void setChildren(List<Fromsource> children) {
        this.children = children;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "Fromsource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", children=" + children +
                ", parentId=" + parentId +
                '}';
    }
}
