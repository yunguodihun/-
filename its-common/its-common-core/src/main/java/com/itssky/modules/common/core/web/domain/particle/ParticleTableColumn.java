package com.itssky.modules.common.core.web.domain.particle;

import com.itssky.modules.common.core.annotation.Excel;
import com.itssky.modules.common.core.utils.StringUtils;
import com.itssky.modules.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 数据清单字段对象 particle_table_column
 *
 * @author itssky
 * @date 2021-04-24
 */
public class ParticleTableColumn extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long columnId;

    /** 归属表编号 */
    @Excel(name = "归属表编号")
    private Long tableId;

    /** 列名称 */
    @Excel(name = "列名称")
    private String columnName;

    /** 列描述 */
    @Excel(name = "列描述")
    private String columnComment;

    /** 列类型 */
    @Excel(name = "列类型")
    private String columnType;

    /** JAVA类型 */
    @Excel(name = "JAVA类型")
    private String javaType;

    /** JAVA字段名 */
    @Excel(name = "JAVA字段名")
    private String javaField;

    /** 是否主键（1是） */
    @Excel(name = "是否主键", readConverterExp = "1=是")
    private String isPk;

    /** 是否自增（1是） */
    @Excel(name = "是否自增", readConverterExp = "1=是")
    private String isIncrement;

    /** 是否必填（1是） */
    @Excel(name = "是否必填", readConverterExp = "1=是")
    private String isRequired;

    /** 是否为插入字段（1是） */
    @Excel(name = "是否为插入字段", readConverterExp = "1=是")
    private String isInsert;

    /** 是否编辑字段（1是） */
    @Excel(name = "是否编辑字段", readConverterExp = "1=是")
    private String isEdit;

    /** 是否列表字段（1是） */
    @Excel(name = "是否列表字段", readConverterExp = "1=是")
    private String isList;

    /** 是否查询字段（1是） */
    @Excel(name = "是否查询字段", readConverterExp = "1=是")
    private String isQuery;

    /** 是否详情字段（1是） */
    @Excel(name = "是否详情字段", readConverterExp = "1=是")
    private String isDetail;

    /** 查询方式（等于、不等于、大于、小于、范围） */
    @Excel(name = "查询方式", readConverterExp = "等=于、不等于、大于、小于、范围")
    private String queryType;

    /** 显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件） */
    @Excel(name = "显示类型", readConverterExp = "文=本框、文本域、下拉框、复选框、单选框、日期控件")
    private String htmlType;

    /** 字典类型 */
    @Excel(name = "字典类型")
    private String dictType;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 角色ID */
    @Excel(name = "角色ID")
    private Long roleId;

    /** 跨距 */
    private String span;

    public void setColumnId(Long columnId)
    {
        this.columnId = columnId;
    }

    public Long getColumnId()
    {
        return columnId;
    }

    public Long getTableId() {
        return tableId;
    }

    public void setTableId(Long tableId) {
        this.tableId = tableId;
    }

    public void setColumnName(String columnName)
    {
        this.columnName = columnName;
    }

    public String getColumnName()
    {
        return columnName;
    }
    public void setColumnComment(String columnComment)
    {
        this.columnComment = columnComment;
    }

    public String getColumnComment()
    {
        return columnComment;
    }
    public void setColumnType(String columnType)
    {
        this.columnType = columnType;
    }

    public String getColumnType()
    {
        return columnType;
    }
    public void setJavaType(String javaType)
    {
        this.javaType = javaType;
    }

    public String getJavaType()
    {
        return javaType;
    }
    public void setJavaField(String javaField)
    {
        this.javaField = javaField;
    }

    public String getJavaField()
    {
        return javaField;
    }
    public void setIsPk(String isPk)
    {
        this.isPk = isPk;
    }

    public String getIsPk()
    {
        return isPk;
    }
    public void setIsIncrement(String isIncrement)
    {
        this.isIncrement = isIncrement;
    }

    public boolean isPk()
    {
        return isPk(this.isPk);
    }

    public boolean isPk(String isPk)
    {
        return isPk != null && StringUtils.equals("1", isPk);
    }

    public String getIsIncrement()
    {
        return isIncrement;
    }
    public void setIsRequired(String isRequired)
    {
        this.isRequired = isRequired;
    }

    public String getIsRequired()
    {
        return isRequired;
    }
    public void setIsInsert(String isInsert)
    {
        this.isInsert = isInsert;
    }

    public String getIsInsert()
    {
        return isInsert;
    }
    public void setIsEdit(String isEdit)
    {
        this.isEdit = isEdit;
    }

    public String getIsEdit()
    {
        return isEdit;
    }
    public void setIsList(String isList)
    {
        this.isList = isList;
    }

    public String getIsList()
    {
        return isList;
    }
    public void setIsQuery(String isQuery)
    {
        this.isQuery = isQuery;
    }

    public String getIsQuery()
    {
        return isQuery;
    }
    public void setIsDetail(String isDetail)
    {
        this.isDetail = isDetail;
    }

    public String getIsDetail()
    {
        return isDetail;
    }
    public void setQueryType(String queryType)
    {
        this.queryType = queryType;
    }

    public String getQueryType()
    {
        return queryType;
    }
    public void setHtmlType(String htmlType)
    {
        this.htmlType = htmlType;
    }

    public String getHtmlType()
    {
        return htmlType;
    }
    public void setDictType(String dictType)
    {
        this.dictType = dictType;
    }

    public String getDictType()
    {
        return dictType;
    }
    public void setSort(Long sort)
    {
        this.sort = sort;
    }

    public Long getSort()
    {
        return sort;
    }
    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }

    public String getSpan() {
        return span;
    }

    public void setSpan(String span) {
        this.span = span;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("columnId", getColumnId())
                .append("tableId", getTableId())
                .append("columnName", getColumnName())
                .append("columnComment", getColumnComment())
                .append("columnType", getColumnType())
                .append("javaType", getJavaType())
                .append("javaField", getJavaField())
                .append("isPk", getIsPk())
                .append("isIncrement", getIsIncrement())
                .append("isRequired", getIsRequired())
                .append("isInsert", getIsInsert())
                .append("isEdit", getIsEdit())
                .append("isList", getIsList())
                .append("isQuery", getIsQuery())
                .append("isDetail", getIsDetail())
                .append("queryType", getQueryType())
                .append("htmlType", getHtmlType())
                .append("dictType", getDictType())
                .append("sort", getSort())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("roleId", getRoleId())
                .toString();
    }
}
