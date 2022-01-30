package com.itssky.modules.common.security.domain;

import com.itssky.modules.common.core.annotation.Excel;
import com.itssky.modules.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 文件存储对象 sys_file
 * 
 * @author itssky
 * @date 2020-12-23
 */
public class SysFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long fileId;

    /** 文件路径 */
    @Excel(name = "文件路径")
    private String filePath;

    /** 文件名 */
    @Excel(name = "文件名")
    private String fileName;

    /** 文件源名 */
    @Excel(name = "文件源名")
    private String fileOriginName;

    /** 文件类型(10-普通附件) */
    @Excel(name = "文件类型(10-普通附件)")
    private String fileType;

    /** 查询ID */
    @Excel(name = "查询ID")
    private Long searchId;

    /** 文件字节 */
    @Excel(name = "文件字节")
    private Integer fileSize;

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public void setFileName(String fileName)
    {
        this.fileName = fileName;
    }

    public String getFileName() 
    {
        return fileName;
    }
    public void setFileType(String fileType) 
    {
        this.fileType = fileType;
    }

    public String getFileType() 
    {
        return fileType;
    }

    public Long getSearchId() {
        return searchId;
    }

    public void setSearchId(Long searchId) {
        this.searchId = searchId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileOriginName() {
        return fileOriginName;
    }

    public void setFileOriginName(String fileOriginName) {
        this.fileOriginName = fileOriginName;
    }

    public Integer getFileSize() {
        return fileSize;
    }

    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fileId", getFileId())
            .append("fileName", getFileName())
            .append("fileType", getFileType())
            .append("filePath", getFilePath())
            .append("searchId", getSearchId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
