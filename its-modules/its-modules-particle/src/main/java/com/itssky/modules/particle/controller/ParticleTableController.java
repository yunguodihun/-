package com.itssky.modules.particle.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itssky.modules.common.core.text.Convert;
import com.itssky.modules.common.core.web.domain.particle.ParticleTable;
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
import com.itssky.modules.particle.service.IParticleTableService;
import com.itssky.modules.common.core.web.controller.BaseController;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * 数据清单Controller
 * 
 * @author itssky
 * @date 2021-04-23
 */
@RestController
@RequestMapping("/particle/table")
public class ParticleTableController extends BaseController
{
    private final static String REQUEST_PATH = "com.itssky.modules.particle.particle.table";

    @Autowired
    private IParticleTableService particleTableService;

    @Autowired
    private IParticleTableColumnService particleTableColumnService;

    /**
     * 查询数据清单列表
     */
    @PreAuthorize("@ss.hasPermi('particle:table:list')")
    @GetMapping("/list")
    public TableDataInfo list(ParticleTable particleTable)
    {
        startPage();
        List<ParticleTable> list = particleTableService.selectParticleTableList(particleTable);
        return getDataTable(list);
    }

    /**
     * 查询gen数据表
     */
    @PreAuthorize("@ss.hasPermi('particle:table:list')")
    @GetMapping("/gen/table/list")
    public TableDataInfo dataList(ParticleTable particleTable)
    {
        startPage();
        List<ParticleTable> list = particleTableService.selectGenTableList(particleTable);
        return getDataTable(list);
    }

    /**
     * 导入表结构
     */
    @PreAuthorize("@ss.hasPermi('particle:table:list')")
    @Log(title = "导入数据清单", businessType = BusinessType.IMPORT)
    @PostMapping("/importTable")
    public AjaxResult importTableSave(String tables,Long roleId)
    {
        String[] tableNames = Convert.toStrArray(tables);
        // 查询表信息
        List<ParticleTable> tableList = particleTableService.selectGenTableListByNames(tableNames);
        particleTableService.importParticleTable(tableList,roleId);
        return AjaxResult.success();
    }

    /**
     * 获取数据清单详细信息
     */
    @SuppressWarnings("AlibabaCollectionInitShouldAssignCapacity")
    @PreAuthorize("@ss.hasPermi('particle:table:query')")
    @GetMapping(value = "/{tableId}/{roleId}")
    public AjaxResult getInfo(@PathVariable("tableId") Long tableId,@PathVariable("roleId") Long roleId)
    {
        ParticleTable table = particleTableService.selectParticleTableByIdAndRoleId(tableId,roleId);
        List<ParticleTableColumn> list = particleTableColumnService.selectParticleTableColumnListByTableId(tableId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("info", table);
        map.put("rows", list);
        return AjaxResult.success(map);
    }

    /**
     * 导出数据清单列表
     */
    @PreAuthorize("@ss.hasPermi('particle:table:export')")
    @Log(title = "数据清单", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ParticleTable particleTable)
    {
        List<ParticleTable> list = particleTableService.selectParticleTableList(particleTable);
        ExcelUtil<ParticleTable> util = new ExcelUtil<ParticleTable>(ParticleTable.class);
        return util.exportExcel(list, "table");
    }

    /**
     * 新增数据清单
     */
    @PreAuthorize("@ss.hasPermi('particle:table:add')")
    @Log(title = "数据清单", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@RequestBody ParticleTable particleTable)
    {
        return toAjax(particleTableService.insertParticleTable(particleTable));
    }

    /**
     * 修改数据清单
     */
    @PreAuthorize("@ss.hasPermi('particle:table:edit')")
    @Log(title = "数据清单", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@RequestBody ParticleTable particleTable)
    {
        particleTableService.validateEdit(particleTable);
        particleTableService.updateParticleTable(particleTable);
        return AjaxResult.success();
    }

    /**
     * 删除数据清单
     */
    @PreAuthorize("@ss.hasPermi('particle:table:remove')")
    @Log(title = "数据清单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{tableIds}")
    public AjaxResult remove(@PathVariable Long[] tableIds)
    {
        particleTableService.deleteParticleTableByIds(tableIds);
        return AjaxResult.success();
    }
}
