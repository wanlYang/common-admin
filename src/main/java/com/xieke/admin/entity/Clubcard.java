package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 会员卡实体
 */
@Alias("Clubcard")
public class Clubcard {

    /**
     * 会员卡ID
     */
    private int id;

    /**
     * 会员名 关联客户表ID
     */
    private Customer customer;

    /**
     * 合同编号
     */
    private String menmbercardNumber;

    /**
     * 1 无效  2 挂失  3 转让  4 续会  5退费  6待续会
     */
    private int memberStatus;

    /**
     * 卡项表cardsetting表主键ID
     */
    private Cardsetting cardsetting;

    /**
     * 来源表fromsource表主键ID
     */
    private Fromsource fromsource;

    /**
     * 员工表user表主键 销售
     */
    private User mt;

    /**
     * 店名
     */
    private String storeScope;

    /**
     * 备注
     */
    private String remark;

    /**
     * 拉取付款方式表数据
     */
    private Paytype paytype;

    /**
     * 付款单据
     */
    private String payReceipts;

    /**
     * 员工表user主键ID 创建人
     */
    private User createUser;

    /**
     * 创建时间
     */
    private Date careteTime;

    /**
     * 员工表user主键ID 修改人
     */
    private User updateUser;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 员工表user主键ID 审核人
     */
    private User checkUser;

    /**
     * 审核时间
     */
    private Date checkTime;

    /**
     * 启用时间
     */
    private Date startTime;

    /**
     * 届满时间
     */
    private Date endTime;

    /**
     * 付款总金额
     */
    private Double payfor;

    /**
     * 审核状态
     */
    private Integer examine;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getMenmbercardNumber() {
        return menmbercardNumber;
    }

    public void setMenmbercardNumber(String menmbercardNumber) {
        this.menmbercardNumber = menmbercardNumber;
    }

    public int getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(int memberStatus) {
        this.memberStatus = memberStatus;
    }

    public Cardsetting getCardsetting() {
        return cardsetting;
    }

    public void setCardsetting(Cardsetting cardsetting) {
        this.cardsetting = cardsetting;
    }

    public Fromsource getFromsource() {
        return fromsource;
    }

    public void setFromsource(Fromsource fromsource) {
        this.fromsource = fromsource;
    }

    public User getMt() {
        return mt;
    }

    public void setMt(User mt) {
        this.mt = mt;
    }

    public String getStoreScope() {
        return storeScope;
    }

    public void setStoreScope(String storeScope) {
        this.storeScope = storeScope;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Paytype getPaytype() {
        return paytype;
    }

    public void setPaytype(Paytype paytype) {
        this.paytype = paytype;
    }

    public String getPayReceipts() {
        return payReceipts;
    }

    public void setPayReceipts(String payReceipts) {
        this.payReceipts = payReceipts;
    }

    public User getCreateUser() {
        return createUser;
    }

    public void setCreateUser(User createUser) {
        this.createUser = createUser;
    }

    public Date getCareteTime() {
        return careteTime;
    }

    public void setCareteTime(Date careteTime) {
        this.careteTime = careteTime;
    }

    public User getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(User updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public User getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(User checkUser) {
        this.checkUser = checkUser;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Double getPayfor() {
        return payfor;
    }

    public void setPayfor(Double payfor) {
        this.payfor = payfor;
    }

    public Integer getExamine() {
        return examine;
    }

    public void setExamine(Integer examine) {
        this.examine = examine;
    }

    @Override
    public String toString() {
        return "Clubcard{" +
                "id=" + id +
                ", customer=" + customer +
                ", menmbercardNumber='" + menmbercardNumber + '\'' +
                ", memberStatus=" + memberStatus +
                ", cardsetting=" + cardsetting +
                ", fromsource=" + fromsource +
                ", mt=" + mt +
                ", storeScope='" + storeScope + '\'' +
                ", remark='" + remark + '\'' +
                ", paytype=" + paytype +
                ", payReceipts='" + payReceipts + '\'' +
                ", createUser=" + createUser +
                ", careteTime=" + careteTime +
                ", updateUser=" + updateUser +
                ", updateTime=" + updateTime +
                ", checkUser=" + checkUser +
                ", checkTime=" + checkTime +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", payfor=" + payfor +
                ", examine=" + examine +
                '}';
    }
}
