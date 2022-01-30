package com.itssky.modules.demo.controller;

import java.util.List;
import com.itssky.modules.common.security.interceptor.annotation.RepeatSubmit;
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
import com.itssky.modules.demo.domain.DemoValidation;
import com.itssky.modules.demo.service.IDemoValidationService;
import com.itssky.modules.common.core.web.controller.BaseController;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * 验证实例Controller
 * 
 * @author itssky
 * @date 2021-03-15
 */
@RestController
@RequestMapping("/demo/valid")
public class DemoValidationController extends BaseController
{
    @Autowired
    private IDemoValidationService demoValidationService;

    /**
     * 查询验证实例列表
     */
    @PreAuthorize("@ss.hasPermi('demo:validation:list')")
    @GetMapping("/list")
    public TableDataInfo list(DemoValidation demoValidation)
    {
        startPage();
        List<DemoValidation> list = demoValidationService.selectDemoValidationList(demoValidation);
        return getDataTable(list);
    }

    /**
     * 获取验证实例详细信息
     */
    @PreAuthorize("@ss.hasPermi('demo:validation:query')")
    @GetMapping(value = "/{validationId}")
    public AjaxResult getInfo(@PathVariable("validationId") Long validationId)
    {
        return AjaxResult.success(demoValidationService.selectDemoValidationById(validationId));
    }

    /**
     * 导出验证实例列表
     */
    @PreAuthorize("@ss.hasPermi('demo:validation:export')")
    @Log(title = "验证实例", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(DemoValidation demoValidation)
    {
        List<DemoValidation> list = demoValidationService.selectDemoValidationList(demoValidation);
        ExcelUtil<DemoValidation> util = new ExcelUtil<DemoValidation>(DemoValidation.class);
        return util.exportExcel(list, "validation");
    }

    /**
     * 新增验证实例
     */
    @PreAuthorize("@ss.hasPermi('demo:validation:add')")
    @Log(title = "验证实例", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@Validated  @RequestBody DemoValidation demoValidation)
    {
        return toAjax(demoValidationService.insertDemoValidation(demoValidation));
    }

    /**
     * 修改验证实例
     */
    @PreAuthorize("@ss.hasPermi('demo:validation:edit')")
    @Log(title = "验证实例", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@Validated @RequestBody DemoValidation demoValidation)
    {
        return toAjax(demoValidationService.updateDemoValidation(demoValidation));
    }

    /**
     * 删除验证实例
     */
    @PreAuthorize("@ss.hasPermi('demo:validation:remove')")
    @Log(title = "验证实例", businessType = BusinessType.DELETE)
	@DeleteMapping("/{validationIds}")
    public AjaxResult remove(@PathVariable Long[] validationIds)
    {
        return toAjax(demoValidationService.deleteLogicDemoValidationByIds(validationIds));
    }
}
