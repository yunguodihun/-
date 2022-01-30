package com.itssky.modules.demo.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.itssky.modules.common.core.annotation.Excel;
import com.itssky.modules.common.core.web.domain.BaseEntity;

/**
 * 验证实例对象 demo_validation
 * 
 * @author itssky
 * @date 2021-03-15
 */
public class DemoValidation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 验证实例ID */
    private Long validationId;

    /** 整数大于零 */
    @Excel(name = "整数大于零")
    private Long intGreaterThanZero;

    /** 浮点大于零 */
    @Excel(name = "浮点大于零")
    private Long floatGreaterThanZero;

    /** 整数 */
    @Excel(name = "整数")
    private Long integerNum;

    /** 必须浮点 */
    @Excel(name = "必须浮点")
    private Long floatNum;

    /** 数字 */
    private String number;

    /** 零到九 */
    private Long zeroToNine;

    /** 经度 */
    private String lng;

    /** 纬度 */
    private String lat;

    /** 中文 */
    private String chinese;

    /** 英文 */
    private String english;

    /** 邮箱 */
    private String email;

    /** 手机号码 */
    private String phoneNumber;

    /** 邮政编码 */
    private String zipCode;

    /** 身份证 */
    private String identityCard;

    /** 车牌号 */
    private String licensePlateNumber;

    /** ip */
    private String ip;

    /** 删除标志（0代表存在 1代表删除） */
    private String delFlag;

    public void setValidationId(Long validationId) 
    {
        this.validationId = validationId;
    }

    public Long getValidationId() 
    {
        return validationId;
    }
    public void setIntGreaterThanZero(Long intGreaterThanZero) 
    {
        this.intGreaterThanZero = intGreaterThanZero;
    }

    public Long getIntGreaterThanZero() 
    {
        return intGreaterThanZero;
    }
    public void setfloatGreaterThanZero(Long floatGreaterThanZero)
    {
        this.floatGreaterThanZero = floatGreaterThanZero;
    }

    public Long getfloatGreaterThanZero()
    {
        return floatGreaterThanZero;
    }
    public void setIntegerNum(Long integerNum) 
    {
        this.integerNum = integerNum;
    }

    public Long getIntegerNum() 
    {
        return integerNum;
    }
    public void setFloatNum(Long floatNum) 
    {
        this.floatNum = floatNum;
    }

    public Long getFloatNum() 
    {
        return floatNum;
    }
    public void setNumber(String number) 
    {
        this.number = number;
    }

    public String getNumber() 
    {
        return number;
    }
    public void setZeroToNine(Long zeroToNine) 
    {
        this.zeroToNine = zeroToNine;
    }

    public Long getZeroToNine() 
    {
        return zeroToNine;
    }
    public void setLng(String lng) 
    {
        this.lng = lng;
    }

    public String getLng() 
    {
        return lng;
    }
    public void setLat(String lat) 
    {
        this.lat = lat;
    }

    public String getLat() 
    {
        return lat;
    }
    public void setchinese(String chinese)
    {
        this.chinese = chinese;
    }

    public String getchinese()
    {
        return chinese;
    }
    public void setEnglish(String english) 
    {
        this.english = english;
    }

    public String getEnglish() 
    {
        return english;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }
    public void setZipCode(String zipCode) 
    {
        this.zipCode = zipCode;
    }

    public String getZipCode() 
    {
        return zipCode;
    }
    public void setIdentityCard(String identityCard) 
    {
        this.identityCard = identityCard;
    }

    public String getIdentityCard() 
    {
        return identityCard;
    }
    public void setLicensePlateNumber(String licensePlateNumber) 
    {
        this.licensePlateNumber = licensePlateNumber;
    }

    public String getLicensePlateNumber() 
    {
        return licensePlateNumber;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("validationId", getValidationId())
            .append("intGreaterThanZero", getIntGreaterThanZero())
            .append("floatGreaterThanZero", getfloatGreaterThanZero())
            .append("integerNum", getIntegerNum())
            .append("floatNum", getFloatNum())
            .append("number", getNumber())
            .append("zeroToNine", getZeroToNine())
            .append("lng", getLng())
            .append("lat", getLat())
            .append("chinese", getchinese())
            .append("english", getEnglish())
            .append("email", getEmail())
            .append("phoneNumber", getPhoneNumber())
            .append("zipCode", getZipCode())
            .append("identityCard", getIdentityCard())
            .append("licensePlateNumber", getLicensePlateNumber())
            .append("ip", getIp())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
