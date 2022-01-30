package com.itssky.modules.demo.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.itssky.modules.common.core.annotation.Excels;
import com.itssky.modules.common.security.domain.DataEntity;
import com.itssky.modules.common.security.domain.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.itssky.modules.common.core.annotation.Excel;

/**
 * 简历信息对象 demo_vitae
 *
 * @author itssky
 * @date 2021-03-12
 */
public class DemoVitae extends DataEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 简历ID
     */
    private Long vitaeId;

    /**
     * 部门ID
     */
    @Excel(name = "部门ID")
    private Long deptId;

    /**
     * 编号
     */
    @Excel(name = "编号")
    private String code;

    /**
     * 生日
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthday;

    /**
     * 排序
     */
    @Excel(name = "排序")
    private String sort;

    /**
     * 姓名
     */
    @Excel(name = "姓名")
    private String name;

    /**
     * 位置
     */
    @Excel(name = "位置")
    private String position;

    /**
     * 邮箱
     */
    @Excel(name = "邮箱")
    private String email;

    /**
     * 手机号码
     */
    @Excel(name = "手机号码")
    private String phoneNumber;

    /**
     * 用户性别（0男 1女 2未知）
     */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /**
     * 头像地址
     */
    @Excel(name = "头像地址")
    private String avatar;

    /**
     * 密码
     */
    @Excel(name = "密码")
    private String password;

    /**
     * 在职状态（0在职 1离职）
     */
    @Excel(name = "在职状态", readConverterExp = "0=在职,1=离职")
    private String status;

    /**
     * 入职开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date entryStartTime;

    /**
     * 入职结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入职结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date entryEndTime;

    /**
     * 擅长技术
     */
    @Excel(name = "擅长技术")
    private String adeptTechnology;

    /**
     * 教育经历
     */
    @Excel(name = "教育经历")
    private String educationExperience;

    /**
     * 附件
     */
    @Excel(name = "附件")
    private String file;

    /**
     * 评分
     */
    @Excel(name = "评分")
    private Long score;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    /**
     * 部门对象
     */
    @Excels({
            @Excel(name = "部门名称", targetAttr = "deptName", type = Excel.Type.EXPORT),
            @Excel(name = "部门负责人", targetAttr = "leader", type = Excel.Type.EXPORT)
    })
    private SysDept dept;

    public void setVitaeId(Long vitaeId) {
        this.vitaeId = vitaeId;
    }

    public Long getVitaeId() {
        return vitaeId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getSort() {
        return sort;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSex() {
        return sex;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setEntryStartTime(Date entryStartTime) {
        this.entryStartTime = entryStartTime;
    }

    public Date getEntryStartTime() {
        return entryStartTime;
    }

    public void setEntryEndTime(Date entryEndTime) {
        this.entryEndTime = entryEndTime;
    }

    public Date getEntryEndTime() {
        return entryEndTime;
    }

    public void setAdeptTechnology(String adeptTechnology) {
        this.adeptTechnology = adeptTechnology;
    }

    public String getAdeptTechnology() {
        return adeptTechnology;
    }

    public void setEducationExperience(String educationExperience) {
        this.educationExperience = educationExperience;
    }

    public String getEducationExperience() {
        return educationExperience;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getFile() {
        return file;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    public Long getScore() {
        return score;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("vitaeId", getVitaeId())
                .append("deptId", getDeptId())
                .append("code", getCode())
                .append("birthday", getBirthday())
                .append("sort", getSort())
                .append("name", getName())
                .append("email", getEmail())
                .append("phoneNumber", getPhoneNumber())
                .append("sex", getSex())
                .append("avatar", getAvatar())
                .append("password", getPassword())
                .append("status", getStatus())
                .append("entryStartTime", getEntryStartTime())
                .append("entryEndTime", getEntryEndTime())
                .append("adeptTechnology", getAdeptTechnology())
                .append("educationExperience", getEducationExperience())
                .append("file", getFile())
                .append("score", getScore())
                .append("delFlag", getDelFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
