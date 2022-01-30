package com.itssky.modules.particle.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.itssky.modules.common.core.annotation.Excel;
import com.itssky.modules.common.core.web.domain.BaseEntity;

/**
 * 颗粒配置对象 particle_config
 * 
 * @author itssky
 * @date 2021-04-29
 */
public class ParticleConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 配置主键 */
    private Long configId;

    /** 配置名称 */
    @Excel(name = "配置名称")
    private String configName;

    /** 路由地址 */
    @Excel(name = "路由地址")
    private String requestPath;

    /** 参数 */
    @Excel(name = "参数")
    private String configParams;

    /** 启用状态（0正常 1停用） */
    @Excel(name = "启用状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 业务表ID */
    @Excel(name = "业务表ID")
    private String tableId;

    public void setConfigId(Long configId) 
    {
        this.configId = configId;
    }

    public Long getConfigId() 
    {
        return configId;
    }
    public void setConfigName(String configName) 
    {
        this.configName = configName;
    }

    public String getConfigName() 
    {
        return configName;
    }
    public void setRequestPath(String requestPath) 
    {
        this.requestPath = requestPath;
    }

    public String getRequestPath() 
    {
        return requestPath;
    }

    public String getConfigParams() {
        return configParams;
    }

    public void setConfigParams(String configParams) {
        this.configParams = configParams;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setTableId(String tableId) 
    {
        this.tableId = tableId;
    }

    public String getTableId() 
    {
        return tableId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("configName", getConfigName())
            .append("requestPath", getRequestPath())
            .append("configParams", getConfigParams())
            .append("status", getStatus())
            .append("tableId", getTableId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
