package com.itssky.modules.particle.controller;

import java.util.List;

import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.common.security.interceptor.annotation.RepeatSubmit;
import com.itssky.modules.particle.service.IParticleTableColumnService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.itssky.modules.common.security.annotation.Log;
import com.itssky.modules.common.security.enums.BusinessType;
import com.itssky.modules.common.core.web.controller.BaseController;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * 数据清单字段Controller
 * 
 * @author itssky
 * @date 2021-04-24
 */
@RestController
@RequestMapping("/system/column")
public class ParticleTableColumnController extends BaseController
{
    private final static String REQUEST_PATH = "com.itssky.modules.system.system.column";

    @Autowired
    private IParticleTableColumnService particleTableColumnService;

    /**
     * 查询数据清单字段列表
     */
    @PreAuthorize("@ss.hasPermi('system:column:list')")
    @GetMapping("/list")
    public TableDataInfo list(ParticleTableColumn particleTableColumn)
    {
        startPage();
        List<ParticleTableColumn> list = particleTableColumnService.selectParticleTableColumnList(particleTableColumn);
        return getDataTable(list);
    }

    /**
     * 获取数据清单字段详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:column:query')")
    @GetMapping(value = "/{columnId}")
    public AjaxResult getInfo(@PathVariable("columnId") Long columnId)
    {
        return AjaxResult.success(particleTableColumnService.selectParticleTableColumnById(columnId));
    }

    /**
     * 导出数据清单字段列表
     */
    @PreAuthorize("@ss.hasPermi('system:column:export')")
    @Log(title = "数据清单字段", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ParticleTableColumn particleTableColumn)
    {
        List<ParticleTableColumn> list = particleTableColumnService.selectParticleTableColumnList(particleTableColumn);
        ExcelUtil<ParticleTableColumn> util = new ExcelUtil<ParticleTableColumn>(ParticleTableColumn.class);
        return util.exportExcel(list, "column");
    }

    /**
     * 新增数据清单字段
     */
    @PreAuthorize("@ss.hasPermi('system:column:add')")
    @Log(title = "数据清单字段", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@RequestBody ParticleTableColumn particleTableColumn)
    {
        return toAjax(particleTableColumnService.insertParticleTableColumn(particleTableColumn));
    }

    /**
     * 修改数据清单字段
     */
    @PreAuthorize("@ss.hasPermi('system:column:edit')")
    @Log(title = "数据清单字段", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@RequestBody ParticleTableColumn particleTableColumn)
    {
        return toAjax(particleTableColumnService.updateParticleTableColumn(particleTableColumn));
    }

    /**
     * 删除数据清单字段
     */
    @PreAuthorize("@ss.hasPermi('system:column:remove')")
    @Log(title = "数据清单字段", businessType = BusinessType.DELETE)
	@DeleteMapping("/{columnIds}")
    public AjaxResult remove(@PathVariable Long[] columnIds)
    {
        return toAjax(particleTableColumnService.deleteLogicParticleTableColumnByIds(columnIds));
    }
}
