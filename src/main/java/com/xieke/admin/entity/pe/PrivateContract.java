package com.xieke.admin.entity.pe;

import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Fromsource;
import com.xieke.admin.entity.User;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("PrivateContract")
public class PrivateContract {

    /**
     * ID
     */
    private Integer id;

    /**
     * 私教合同编号
     */
    private String contractNumber;

    /**
     * 客户信息
     */
    private Customer customer;

    /**
     * 是否自由课 0不是 1是
     */
    private int isFreeClass;

    /**
     * 来源表
     */
    private Fromsource fromsource;

    /**
     * 上课教练
     */
    private Coach coach;

    /**
     * 上课课程
     */
    private Course course;

    /**
     * 上课时长 （课时 默认60min/节）
     */
    private String classHour;

    /**
     * 销售顾问
     */
    private User mt;

    /**
     * 课程单价
     */
    private String unitPrice;

    /**
     * 购买次数
     */
    private Integer purchaseTimes;

    /**
     * 赠送次数
     */
    private Integer freqPresent;

    /**
     * 总次数
     */
    private Integer totalNumber;


    /**
     * 购买总金额
     */
    private Integer totalPurchaseAmount;

    /**
     * 赠送总金额
     */
    private String totalAmountOfGifts;


    /**
     * 总金额
     */
    private String totalSum;

    /**
     * 实际总收款金额
     */
    private String payfor;

    /**
     * 付款金额
     */
    private String totalPaymentAmount;


    /**
     * 生效日期
     */
    private Date effectiveDate;

    /**
     * 截止日期
     */
    private Date closingDate;

    /**
     * 签署日期
     */
    private Date signingDate;

    /**
     * 备注
     */
    private String remark;

    /**
     * 付款单据
     */
    private String paymentDocu;


    /**
     * 赠送积分
     */
    private Integer presentationPoints;

    /**
     * 所属店面
     */
    private String store;

    /**
     * 审核状态 0未审核 1已审核
     */
    private int auditStatus;

    /**
     * 状态 0有效 1无效 2过期 3退费
     */
    private int status;

    /**
     * 延期状态 0正常 1延1  2延2  3延期3
     */
    private int postponement;

    /**
     * 剩余次数
     */
    private int residualTimes;

    /**
     * 操作员
     */
    private User operator;


    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 审核人
     */
    private User checkUser;

    /**
     * 审核时间
     */
    private Date checkTime;

    public String getPayfor() {
        return payfor;
    }

    public void setPayfor(String payfor) {
        this.payfor = payfor;
    }

    public Date getSigningDate() {
        return signingDate;
    }

    public void setSigningDate(Date signingDate) {
        this.signingDate = signingDate;
    }

    public String getTotalPaymentAmount() {
        return totalPaymentAmount;
    }

    public void setTotalPaymentAmount(String totalPaymentAmount) {
        this.totalPaymentAmount = totalPaymentAmount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getIsFreeClass() {
        return isFreeClass;
    }

    public void setIsFreeClass(int isFreeClass) {
        this.isFreeClass = isFreeClass;
    }

    public Fromsource getFromsource() {
        return fromsource;
    }

    public void setFromsource(Fromsource fromsource) {
        this.fromsource = fromsource;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getClassHour() {
        return classHour;
    }

    public void setClassHour(String classHour) {
        this.classHour = classHour;
    }

    public User getMt() {
        return mt;
    }

    public void setMt(User mt) {
        this.mt = mt;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getPurchaseTimes() {
        return purchaseTimes;
    }

    public void setPurchaseTimes(Integer purchaseTimes) {
        this.purchaseTimes = purchaseTimes;
    }

    public Integer getFreqPresent() {
        return freqPresent;
    }

    public void setFreqPresent(Integer freqPresent) {
        this.freqPresent = freqPresent;
    }

    public Integer getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(Integer totalNumber) {
        this.totalNumber = totalNumber;
    }

    public Integer getTotalPurchaseAmount() {
        return totalPurchaseAmount;
    }

    public void setTotalPurchaseAmount(Integer totalPurchaseAmount) {
        this.totalPurchaseAmount = totalPurchaseAmount;
    }

    public String getTotalAmountOfGifts() {
        return totalAmountOfGifts;
    }

    public void setTotalAmountOfGifts(String totalAmountOfGifts) {
        this.totalAmountOfGifts = totalAmountOfGifts;
    }

    public String getTotalSum() {
        return totalSum;
    }

    public void setTotalSum(String totalSum) {
        this.totalSum = totalSum;
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPaymentDocu() {
        return paymentDocu;
    }

    public void setPaymentDocu(String paymentDocu) {
        this.paymentDocu = paymentDocu;
    }

    public Integer getPresentationPoints() {
        return presentationPoints;
    }

    public void setPresentationPoints(Integer presentationPoints) {
        this.presentationPoints = presentationPoints;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public int getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(int auditStatus) {
        this.auditStatus = auditStatus;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPostponement() {
        return postponement;
    }

    public void setPostponement(int postponement) {
        this.postponement = postponement;
    }

    public int getResidualTimes() {
        return residualTimes;
    }

    public void setResidualTimes(int residualTimes) {
        this.residualTimes = residualTimes;
    }

    public User getOperator() {
        return operator;
    }

    public void setOperator(User operator) {
        this.operator = operator;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    @Override
    public String toString() {
        return "PrivateContract{" +
                "id=" + id +
                ", contractNumber='" + contractNumber + '\'' +
                ", customer=" + customer +
                ", isFreeClass=" + isFreeClass +
                ", fromsource=" + fromsource +
                ", coach=" + coach +
                ", course=" + course +
                ", classHour='" + classHour + '\'' +
                ", mt=" + mt +
                ", unitPrice='" + unitPrice + '\'' +
                ", purchaseTimes=" + purchaseTimes +
                ", freqPresent=" + freqPresent +
                ", totalNumber=" + totalNumber +
                ", totalPurchaseAmount=" + totalPurchaseAmount +
                ", totalAmountOfGifts='" + totalAmountOfGifts + '\'' +
                ", totalSum='" + totalSum + '\'' +
                ", payfor='" + payfor + '\'' +
                ", totalPaymentAmount='" + totalPaymentAmount + '\'' +
                ", effectiveDate=" + effectiveDate +
                ", closingDate=" + closingDate +
                ", signingDate=" + signingDate +
                ", remark='" + remark + '\'' +
                ", paymentDocu='" + paymentDocu + '\'' +
                ", presentationPoints=" + presentationPoints +
                ", store='" + store + '\'' +
                ", auditStatus=" + auditStatus +
                ", status=" + status +
                ", postponement=" + postponement +
                ", residualTimes=" + residualTimes +
                ", operator=" + operator +
                ", createTime=" + createTime +
                ", checkUser=" + checkUser +
                ", checkTime=" + checkTime +
                '}';
    }
}
