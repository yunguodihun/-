package com.itssky.modules.common.core.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itssky.modules.common.core.constant.HttpStatus;
import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.utils.ForEachUtils;
import com.itssky.modules.common.core.utils.StringUtils;
import com.itssky.modules.common.core.utils.sql.SqlUtil;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.web.domain.gen.GenTableColumn;
import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.common.core.web.page.PageDomain;
import com.itssky.modules.common.core.web.page.TableDataInfo;
import com.itssky.modules.common.core.web.page.TableSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.util.*;

/**
 * web层通用数据处理
 *
 * @author ITS
 */
@SuppressWarnings("AlibabaCollectionInitShouldAssignCapacity")
public class BaseController
{
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    public static final String SHOW_COLUMN = "1";

    /**
     * 将前台传递过来的日期格式的字符串，自动转化为Date类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport()
        {
            @Override
            public void setAsText(String text)
            {
                setValue(DateUtils.parseDate(text));
            }
        });
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 响应请求固定表格分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDynamicDataTable(List<?> list,Map<String,Object> tableColumns,Map<String,Object> queryColumns,Map<String,Object> editColumns,Map<String,Object> insertColumns)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());

        rspData.setTableColumns(tableColumns);
        rspData.setQueryColumns(queryColumns);
        rspData.setEditColumns(editColumns);
        rspData.setInsertColumns(insertColumns);
        return rspData;
    }

    /**
     * 响应请求动态表格分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDynamicDataTable(List<?> list,List<ParticleTableColumn> columns)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        // 表格动态赋值列表、详情、查询项、修改项、新增项
        setColumns(columns,rspData);
        return rspData;
    }

    /**
     * 表格动态赋值列表、详情、查询项、修改项、新增项
     * @param columns
     * @param rspData
     */
    public void setColumns(List<ParticleTableColumn> columns,TableDataInfo rspData) {
        // 表格列
        Map<String,Object> tableColumns = new HashMap<>();
        // 查询列
        Map<String,Object> queryColumns = new HashMap<>();
        // 详情列
        Map<String,Object> detailColumns = new HashMap<>();
        // 修改列
        Map<String,Object> editColumns = new HashMap<>();
        // 新增列
        Map<String,Object> insertColumns = new HashMap<>();
        // 动态表格列
        List<Map<String,Object>> dynamicTableDataColumns = new ArrayList<>();
        // 动态表格详情列
        List<Map<String,Object>> dynamicTableDataDetailColumns = new ArrayList<>();
        // 表格显隐列
        List<Map<String,Object>> showHiddeColumns = new ArrayList<>();

        ForEachUtils.forEach(0, columns, (index, item) -> {
            Map<String,Object> dynamicTableData = new HashMap<String,Object>();
            Map<String,Object> dynamicTableDataDetail = new HashMap<String,Object>();
            Map<String,Object> column = new HashMap<String,Object>();
            // 列表显示
            if (SHOW_COLUMN.equals(item.getIsList())) {
                dynamicTableData.put("dataItem",item.getJavaField());
                dynamicTableData.put("dataName",item.getColumnComment());
                dynamicTableData.put("dataType",item.getJavaType());
                dynamicTableData.put("dictType",item.getDictType() == null ? "" : item.getDictType());
                dynamicTableData.put("htmlType",item.getHtmlType());
                dynamicTableData.put("span",item.getSpan());
                dynamicTableDataColumns.add(dynamicTableData);
                // 显隐列
                column.put("key",item.getColumnName());
                column.put("label",item.getColumnComment());
                column.put("visible",true);
                showHiddeColumns.add(column);
                tableColumns.put(item.getJavaField(), true);
            }
            // 详情项显示
            if (SHOW_COLUMN.equals(item.getIsDetail())) {
                dynamicTableDataDetail.put("dataItem",item.getJavaField());
                dynamicTableDataDetail.put("dataName",item.getColumnComment());
                dynamicTableDataDetail.put("dataType",item.getJavaType());
                dynamicTableDataDetail.put("dictType",item.getDictType() == null ? "" : item.getDictType());
                dynamicTableDataDetail.put("htmlType",item.getHtmlType());
                dynamicTableDataDetail.put("span",item.getSpan());
                dynamicTableDataDetailColumns.add(dynamicTableDataDetail);
            }
            // 查询项显示
            if (SHOW_COLUMN.equals(item.getIsQuery())) {
                queryColumns.put(item.getJavaField(), true);
            }
            // 修改项显示
            if (SHOW_COLUMN.equals(item.getIsEdit())) {
                editColumns.put(item.getJavaField(), true);
            }
            // 新增项显示
            if (SHOW_COLUMN.equals(item.getIsInsert())) {
                insertColumns.put(item.getJavaField(), true);
            }
        });

        rspData.setTableColumns(tableColumns);
        rspData.setQueryColumns(queryColumns);
        rspData.setDetailColumns(detailColumns);
        rspData.setEditColumns(editColumns);
        rspData.setInsertColumns(insertColumns);
        rspData.setColumns(showHiddeColumns);
        rspData.setDynamicTableDataColumns(dynamicTableDataColumns);
        rspData.setDynamicTableDataDetailColumns(dynamicTableDataDetailColumns);

    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows)
    {
        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
    }

    /**
     * 响应返回结果
     *
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result)
    {
        return result ? success() : error();
    }

    /**
     * 返回成功
     */
    public AjaxResult success()
    {
        return AjaxResult.success();
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(String message)
    {
        return AjaxResult.success(message);
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error()
    {
        return AjaxResult.error();
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error(String message)
    {
        return AjaxResult.error(message);
    }

    /**
     * 页面跳转
     */
    public String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }
}
