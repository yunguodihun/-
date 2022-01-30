package com.itssky.modules.common.sequence.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * common-sequence模块的配置类。
 *
 * @author Lang
 * @date 2021-08-13
 */
@ConfigurationProperties(prefix = "sequence")
public class IdGeneratorProperties {

    /**
     * 基础版生成器所需的WorkNode参数值。仅当advanceIdGenerator为false时生效。
     */
    private Integer snowflakeWorkNode = 1;

    public Integer getSnowflakeWorkNode() {
        return snowflakeWorkNode;
    }

    public void setSnowflakeWorkNode(Integer snowflakeWorkNode) {
        this.snowflakeWorkNode = snowflakeWorkNode;
    }
}
