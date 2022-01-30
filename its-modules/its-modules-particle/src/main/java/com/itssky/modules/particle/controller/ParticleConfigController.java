package com.itssky.modules.particle.controller;

import java.util.List;
import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.common.security.interceptor.annotation.RepeatSubmit;
import com.itssky.modules.particle.service.IParticleTableColumnService;
import com.itssky.modules.particle.service.IParticleTableService;
import com.itssky.modules.particle.util.ParticleUtils;
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
import com.itssky.modules.particle.domain.ParticleConfig;
import com.itssky.modules.particle.service.IParticleConfigService;
import com.itssky.modules.common.core.web.controller.BaseController;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * 颗粒配置Controller
 * 
 * @author itssky
 * @date 2021-04-29
 */
@RestController
@RequestMapping("/particle/config")
public class ParticleConfigController extends BaseController
{
    private final static String REQUEST_PATH = "com.itssky.modules.particle.particle.config";

    @Autowired
    private IParticleConfigService particleConfigService;

    /**
     * 查询颗粒配置列表
     */
    @PreAuthorize("@ss.hasPermi('particle:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(ParticleConfig particleConfig)
    {
        startPage();
        List<ParticleConfig> list = particleConfigService.selectParticleConfigList(particleConfig);
        List<ParticleTableColumn> columns = ParticleUtils.getParticleTableColumns(REQUEST_PATH);
        return getDynamicDataTable(list,columns);
    }

    /**
     * 获取颗粒配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('particle:config:query')")
    @GetMapping(value = "/{configId}")
    public AjaxResult getInfo(@PathVariable("configId") Long configId)
    {
        return AjaxResult.success(particleConfigService.selectParticleConfigById(configId));
    }

    /**
     * 导出颗粒配置列表
     */
    @PreAuthorize("@ss.hasPermi('particle:config:export')")
    @Log(title = "颗粒配置", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ParticleConfig particleConfig)
    {
        List<ParticleConfig> list = particleConfigService.selectParticleConfigList(particleConfig);
        ExcelUtil<ParticleConfig> util = new ExcelUtil<ParticleConfig>(ParticleConfig.class);
        return util.exportExcel(list, "config");
    }

    /**
     * 新增颗粒配置
     */
    @PreAuthorize("@ss.hasPermi('particle:config:add')")
    @Log(title = "颗粒配置", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@RequestBody ParticleConfig particleConfig)
    {
        return toAjax(particleConfigService.insertParticleConfig(particleConfig));
    }

    /**
     * 修改颗粒配置
     */
    @PreAuthorize("@ss.hasPermi('particle:config:edit')")
    @Log(title = "颗粒配置", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@RequestBody ParticleConfig particleConfig)
    {
        return toAjax(particleConfigService.updateParticleConfig(particleConfig));
    }

    /**
     * 删除颗粒配置
     */
    @PreAuthorize("@ss.hasPermi('particle:config:remove')")
    @Log(title = "颗粒配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{configIds}")
    public AjaxResult remove(@PathVariable Long[] configIds)
    {
        return toAjax(particleConfigService.deleteLogicParticleConfigByIds(configIds));
    }
}
