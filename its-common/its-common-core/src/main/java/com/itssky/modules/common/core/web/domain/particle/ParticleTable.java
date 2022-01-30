package com.itssky.modules.common.core.web.domain.particle;

import com.itssky.modules.common.core.annotation.Excel;
import com.itssky.modules.common.core.web.domain.BaseEntity;
import com.itssky.modules.common.core.web.domain.gen.GenTableColumn;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * 数据清单对象 particle_table
 * 
 * @author itssky
 * @date 2021-04-23
 */
public class ParticleTable extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long tableId;

    /** 表名称 */
    @Excel(name = "表名称")
    private String tableName;

    /** 表描述 */
    @Excel(name = "表描述")
    private String tableComment;

    /** 角色ID */
    @Excel(name = "角色ID")
    private Long roleId;

    /** 角色名称 */
    private String roleName;

    /** 实体类名称 */
    @Excel(name = "实体类名称")
    private String className;

    /** 使用的模板（crud单表操作 tree树表操作） */
    @Excel(name = "使用的模板", readConverterExp = "c=rud单表操作,t=ree树表操作")
    private String tplCategory;

    /** 生成包路径 */
    @Excel(name = "生成包路径")
    private String packageName;

    /** 生成模块名 */
    @Excel(name = "生成模块名")
    private String moduleName;

    /** 生成业务名 */
    @Excel(name = "生成业务名")
    private String businessName;

    /** 生成功能名 */
    @Excel(name = "生成功能名")
    private String functionName;

    /** 生成功能作者 */
    @Excel(name = "生成功能作者")
    private String functionAuthor;

    /** 生成代码方式（0zip压缩包 1自定义路径） */
    @Excel(name = "生成代码方式", readConverterExp = "0=zip压缩包,1=自定义路径")
    private String genType;

    /** 生成路径（不填默认项目路径） */
    @Excel(name = "生成路径", readConverterExp = "不=填默认项目路径")
    private String genPath;

    /** 其它生成选项 */
    @Excel(name = "其它生成选项")
    private String options;

    /** 颗粒注册状态（0-未注册  1-已注册） */
    @Excel(name = "颗粒注册状态", readConverterExp = "0=-未注册,1=-已注册")
    private String particleStatus;

    /** 请求路径 */
    @Excel(name = "请求路径")
    private String requestPath;

    /** 主键信息 */
    private GenTableColumn pkColumn;

    /** 表列信息 */
    @Valid
    private List<ParticleTableColumn> columns;


    /** 树编码字段 */
    private String treeCode;

    /** 树父编码字段 */
    private String treeParentCode;

    /** 树名称字段 */
    private String treeName;

    /** 上级菜单ID字段 */
    private String parentMenuId;

    /** 上级菜单名称字段 */
    private String parentMenuName;

    public void setTableId(Long tableId) 
    {
        this.tableId = tableId;
    }

    public Long getTableId() 
    {
        return tableId;
    }
    public void setTableName(String tableName) 
    {
        this.tableName = tableName;
    }

    public String getTableName() 
    {
        return tableName;
    }
    public void setTableComment(String tableComment) 
    {
        this.tableComment = tableComment;
    }

    public String getTableComment() 
    {
        return tableComment;
    }
    public void setRoleId(Long roleId) 
    {
        this.roleId = roleId;
    }

    public Long getRoleId() 
    {
        return roleId;
    }
    public void setClassName(String className) 
    {
        this.className = className;
    }

    public String getClassName() 
    {
        return className;
    }
    public void setTplCategory(String tplCategory) 
    {
        this.tplCategory = tplCategory;
    }

    public String getTplCategory() 
    {
        return tplCategory;
    }
    public void setPackageName(String packageName) 
    {
        this.packageName = packageName;
    }

    public String getPackageName() 
    {
        return packageName;
    }
    public void setModuleName(String moduleName) 
    {
        this.moduleName = moduleName;
    }

    public String getModuleName() 
    {
        return moduleName;
    }
    public void setBusinessName(String businessName) 
    {
        this.businessName = businessName;
    }

    public String getBusinessName() 
    {
        return businessName;
    }
    public void setFunctionName(String functionName) 
    {
        this.functionName = functionName;
    }

    public String getFunctionName() 
    {
        return functionName;
    }
    public void setFunctionAuthor(String functionAuthor) 
    {
        this.functionAuthor = functionAuthor;
    }

    public String getFunctionAuthor() 
    {
        return functionAuthor;
    }
    public void setGenType(String genType) 
    {
        this.genType = genType;
    }

    public String getGenType() 
    {
        return genType;
    }
    public void setGenPath(String genPath) 
    {
        this.genPath = genPath;
    }

    public String getGenPath() 
    {
        return genPath;
    }
    public void setOptions(String options) 
    {
        this.options = options;
    }

    public String getOptions() 
    {
        return options;
    }
    public void setParticleStatus(String particleStatus) 
    {
        this.particleStatus = particleStatus;
    }

    public String getParticleStatus() 
    {
        return particleStatus;
    }
    public void setRequestPath(String requestPath) 
    {
        this.requestPath = requestPath;
    }

    public String getRequestPath() 
    {
        return requestPath;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public GenTableColumn getPkColumn() {
        return pkColumn;
    }

    public void setPkColumn(GenTableColumn pkColumn) {
        this.pkColumn = pkColumn;
    }

    public List<ParticleTableColumn> getColumns() {
        return columns;
    }

    public void setColumns(List<ParticleTableColumn> columns) {
        this.columns = columns;
    }

    public String getTreeCode() {
        return treeCode;
    }

    public void setTreeCode(String treeCode) {
        this.treeCode = treeCode;
    }

    public String getTreeParentCode() {
        return treeParentCode;
    }

    public void setTreeParentCode(String treeParentCode) {
        this.treeParentCode = treeParentCode;
    }

    public String getTreeName() {
        return treeName;
    }

    public void setTreeName(String treeName) {
        this.treeName = treeName;
    }

    public String getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(String parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

    public String getParentMenuName() {
        return parentMenuName;
    }

    public void setParentMenuName(String parentMenuName) {
        this.parentMenuName = parentMenuName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("tableId", getTableId())
            .append("tableName", getTableName())
            .append("tableComment", getTableComment())
            .append("roleId", getRoleId())
            .append("className", getClassName())
            .append("tplCategory", getTplCategory())
            .append("packageName", getPackageName())
            .append("moduleName", getModuleName())
            .append("businessName", getBusinessName())
            .append("functionName", getFunctionName())
            .append("functionAuthor", getFunctionAuthor())
            .append("genType", getGenType())
            .append("genPath", getGenPath())
            .append("options", getOptions())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("particleStatus", getParticleStatus())
            .append("requestPath", getRequestPath())
            .toString();
    }
}
