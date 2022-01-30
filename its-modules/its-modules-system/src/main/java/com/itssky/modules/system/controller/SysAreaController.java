package com.itssky.modules.system.controller;

import java.util.List;

import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.common.security.interceptor.annotation.RepeatSubmit;
import com.itssky.modules.particle.util.ParticleUtils;
import com.itssky.modules.system.domain.SysArea;
import com.itssky.modules.system.service.ISysAreaService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
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
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * 区域Controller
 * 
 * @author itssky
 * @date 2021-05-04
 */
@RestController
@RequestMapping("/system/area")
public class SysAreaController extends BaseController
{

    /**
     * 请求路径
     */
    private final static String REQUEST_PATH = "com.itssky.modules.system.system.area";

    @Autowired
    private ISysAreaService sysAreaService;

    /**
     * 查询区域列表
     */
    @PreAuthorize("@ss.hasPermi('system:area:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysArea sysArea)
    {
        startPage();
        List<SysArea> list = sysAreaService.selectSysAreaList(sysArea);
        List<ParticleTableColumn> columns = ParticleUtils.getParticleTableColumns(REQUEST_PATH);
        return getDynamicDataTable(list,columns);
    }

    /**
     * 获取区域详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:area:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(sysAreaService.selectSysAreaById(id));
    }

    /**
     * 导出区域列表
     */
    @PreAuthorize("@ss.hasPermi('system:area:export')")
    @Log(title = "区域", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysArea sysArea)
    {
        List<SysArea> list = sysAreaService.selectSysAreaList(sysArea);
        ExcelUtil<SysArea> util = new ExcelUtil<SysArea>(SysArea.class);
        return util.exportExcel(list, "area");
    }

    /**
     * 新增区域
     */
    @PreAuthorize("@ss.hasPermi('system:area:add')")
    @Log(title = "区域", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@Validated @RequestBody SysArea sysArea)
    {
        return toAjax(sysAreaService.insertSysArea(sysArea));
    }

    /**
     * 修改区域
     */
    @PreAuthorize("@ss.hasPermi('system:area:edit')")
    @Log(title = "区域", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@Validated @RequestBody SysArea sysArea)
    {
        return toAjax(sysAreaService.updateSysArea(sysArea));
    }

    /**
     * 删除区域
     */
    @PreAuthorize("@ss.hasPermi('system:area:remove')")
    @Log(title = "区域", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(sysAreaService.deleteLogicSysAreaByIds(ids));
    }
}
