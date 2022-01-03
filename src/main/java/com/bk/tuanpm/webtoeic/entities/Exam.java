package com.bk.tuanpm.webtoeic.entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "exam")
public class Exam implements Serializable {
    @Transient
    public static final String EASY = "1";
    @Transient
    public static final String MEDIUM = "2";
    @Transient
    public static final String HARD = "3";

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_exam", nullable = false)
    private Integer baithithuid;

    @Column(name = "title")
    private String tenbaithithu;

    @Column(name = "thumbnail")
    private String anhbaithithu;

    @Column
    private Date dateAdd;

    private int countTest;

    @Column(nullable = true, columnDefinition = "float default 0")
    private float countRate;
    private String description;
    private String level;
    private String updateBy;
    private Date updateDate;

    @ManyToOne(fetch = FetchType.EAGER)
    private ContentAdmin userAdd;

    private String isActive;
    private String delFlg;

    public Integer getBaithithuid() {
        return baithithuid;
    }

    public void setBaithithuid(Integer baithithuid) {
        this.baithithuid = baithithuid;
    }

    public String getTenbaithithu() {
        return tenbaithithu;
    }

    public void setTenbaithithu(String tenbaithithu) {
        this.tenbaithithu = tenbaithithu;
    }

    public String getAnhbaithithu() {
        return anhbaithithu;
    }

    public void setAnhbaithithu(String anhbaithithu) {
        this.anhbaithithu = anhbaithithu;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public int getCountTest() {
        return countTest;
    }

    public void setCountTest(int countTest) {
        this.countTest = countTest;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public ContentAdmin getUserAdd() {
        return userAdd;
    }

    public void setUserAdd(ContentAdmin userAdd) {
        this.userAdd = userAdd;
    }

    public float getCountRate() {
        return countRate;
    }

    public void setCountRate(float countRate) {
        this.countRate = countRate;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public String getDelFlg() {
        return delFlg;
    }

    public void setDelFlg(String delFlg) {
        this.delFlg = delFlg;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((baithithuid == null) ? 0 : baithithuid.hashCode());
        result = prime * result + ((dateAdd == null) ? 0 : dateAdd.hashCode());
        result = prime * result + ((userAdd == null) ? 0 : userAdd.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Exam other = (Exam) obj;
        if (baithithuid == null) {
            if (other.baithithuid != null)
                return false;
        } else if (!baithithuid.equals(other.baithithuid))
            return false;
        if (dateAdd == null) {
            if (other.dateAdd != null)
                return false;
        } else if (!dateAdd.equals(other.dateAdd))
            return false;
        if (userAdd == null) {
            if (other.userAdd != null)
                return false;
        } else if (!userAdd.equals(other.userAdd))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Exam [baithithuid=" + baithithuid + ", tenbaithithu=" + tenbaithithu + ", anhbaithithu=" + anhbaithithu
                + ", dateAdd=" + dateAdd + "]";
    }

}
