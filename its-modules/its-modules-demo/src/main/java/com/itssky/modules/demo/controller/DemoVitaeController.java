package com.itssky.modules.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.common.security.interceptor.annotation.RepeatSubmit;
import com.itssky.modules.particle.util.AttributesExtractUtils;
import com.itssky.modules.particle.util.ParticleUtils;
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
import com.itssky.modules.demo.domain.DemoVitae;
import com.itssky.modules.demo.service.IDemoVitaeService;
import com.itssky.modules.common.core.web.controller.BaseController;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * 简历信息Controller
 * 
 * @author itssky
 * @date 2021-03-12
 */
@RestController
@RequestMapping("/demo/vitae")
public class DemoVitaeController extends BaseController
{

    /**
     * 请求路径
     */
    public static final String REQUEST_PATH = "com.itssky.modules.demo.demo.vitae";

    @Autowired
    private IDemoVitaeService demoVitaeService;

    /**
     * 查询简历信息列表
     */
    @PreAuthorize("@ss.hasPermi('demo:vitae:list')")
    @GetMapping("/list")
    public TableDataInfo list(DemoVitae demoVitae)
    {
        startPage();
        List<DemoVitae> list = demoVitaeService.selectDemoVitaeList(demoVitae);
        List<ParticleTableColumn> columns = ParticleUtils.getParticleTableColumns(REQUEST_PATH);
        return getDynamicDataTable(list,columns);
    }

    /**
     * 获取简历信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('demo:vitae:query')")
    @GetMapping(value = "/{vitaeId}")
    public AjaxResult getInfo(@PathVariable("vitaeId") Long vitaeId)
    {
        return AjaxResult.success(demoVitaeService.selectDemoVitaeById(vitaeId));
    }

    /**
     * 导出简历信息列表
     */
    @PreAuthorize("@ss.hasPermi('demo:vitae:export')")
    @Log(title = "简历信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DemoVitae demoVitae)
    {
        List<DemoVitae> list = demoVitaeService.selectDemoVitaeList(demoVitae);
        List<DemoVitae> list1 = new ArrayList<>();
        for (DemoVitae viate : list) {
            //设置需要输出的实体中的字段，没有罗列的就不输出
            Map<String, Object> linklistExtracted =
                    AttributesExtractUtils.extract(viate, "vitae_id", "code", "birthday");
            DemoVitae vitae = AttributesExtractUtils.map2Object(linklistExtracted,DemoVitae.class);
            list1.add(vitae);
        }
        ExcelUtil<DemoVitae> util = new ExcelUtil<DemoVitae>(DemoVitae.class);
        return util.exportExcel(list1, "vitae");
    }

    /**
     * 新增简历信息
     */
    @PreAuthorize("@ss.hasPermi('demo:vitae:add')")
    @Log(title = "简历信息", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@Validated  @RequestBody DemoVitae demoVitae)
    {
        return toAjax(demoVitaeService.insertDemoVitae(demoVitae));
    }

    /**
     * 修改简历信息
     */
    @PreAuthorize("@ss.hasPermi('demo:vitae:edit')")
    @Log(title = "简历信息", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@Validated @RequestBody DemoVitae demoVitae)
    {
        return toAjax(demoVitaeService.updateDemoVitae(demoVitae));
    }

    /**
     * 删除简历信息
     */
    @PreAuthorize("@ss.hasPermi('demo:vitae:remove')")
    @Log(title = "简历信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{vitaeIds}")
    public AjaxResult remove(@PathVariable Long[] vitaeIds)
    {
        return toAjax(demoVitaeService.deleteLogicDemoVitaeByIds(vitaeIds));
    }


}
