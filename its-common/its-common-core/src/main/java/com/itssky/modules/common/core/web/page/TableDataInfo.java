package com.itssky.modules.common.core.web.page;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 表格分页数据对象
 * 
 * @author ITS
 */
public class TableDataInfo implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 总记录数 */
    private long total;

    /** 列表数据 */
    private List<?> rows;

    /** 消息状态码 */
    private int code;

    /** 消息内容 */
    private String msg;

    private Map map;

    /** 表格列 */
    private Map<String,Object> tableColumns;

    /** 查询列 */
    private Map<String,Object> queryColumns;

    /** 详情列 */
    private Map<String,Object> detailColumns;

    /** 修改列 */
    private Map<String,Object> editColumns;

    /** 插入列 */
    private Map<String,Object> insertColumns;

    /** 显隐列 */
    private List<Map<String,Object>> columns;

    /** 动态表格列 */
    private List<Map<String,Object>> dynamicTableDataColumns;

    /** 动态表格详情列 */
    private List<Map<String,Object>> dynamicTableDataDetailColumns;

    /**
     * 表格数据对象
     */
    public TableDataInfo()
    {
    }

    /**
     * 分页
     * 
     * @param list 列表数据
     * @param total 总记录数
     */
    public TableDataInfo(List<?> list, int total)
    {
        this.rows = list;
        this.total = total;
    }

    public TableDataInfo(List<?> list, int total, List<Map<?,?>> mapList)
    {
        this.rows = list;
        this.total = total;
        this.map = map;
    }

    public long getTotal()
    {
        return total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }

    public List<?> getRows()
    {
        return rows;
    }

    public void setRows(List<?> rows)
    {
        this.rows = rows;
    }

    public int getCode()
    {
        return code;
    }

    public void setCode(int code)
    {
        this.code = code;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public List<Map<String, Object>> getColumns() {
        return columns;
    }

    public void setColumns(List<Map<String, Object>> columns) {
        this.columns = columns;
    }

    public List<Map<String, Object>> getDynamicTableDataColumns() {
        return dynamicTableDataColumns;
    }

    public void setDynamicTableDataColumns(List<Map<String, Object>> dynamicTableDataColumns) {
        this.dynamicTableDataColumns = dynamicTableDataColumns;
    }

    public List<Map<String, Object>> getDynamicTableDataDetailColumns() {
        return dynamicTableDataDetailColumns;
    }

    public void setDynamicTableDataDetailColumns(List<Map<String, Object>> dynamicTableDataDetailColumns) {
        this.dynamicTableDataDetailColumns = dynamicTableDataDetailColumns;
    }

    public Map<String, Object> getTableColumns() {
        return tableColumns;
    }

    public void setTableColumns(Map<String, Object> tableColumns) {
        this.tableColumns = tableColumns;
    }

    public Map<String, Object> getQueryColumns() {
        return queryColumns;
    }

    public void setQueryColumns(Map<String, Object> queryColumns) {
        this.queryColumns = queryColumns;
    }

    public Map<String, Object> getEditColumns() {
        return editColumns;
    }

    public void setEditColumns(Map<String, Object> editColumns) {
        this.editColumns = editColumns;
    }

    public Map<String, Object> getInsertColumns() {
        return insertColumns;
    }

    public void setInsertColumns(Map<String, Object> insertColumns) {
        this.insertColumns = insertColumns;
    }

    public Map<String, Object> getDetailColumns() {
        return detailColumns;
    }

    public void setDetailColumns(Map<String, Object> detailColumns) {
        this.detailColumns = detailColumns;
    }
}