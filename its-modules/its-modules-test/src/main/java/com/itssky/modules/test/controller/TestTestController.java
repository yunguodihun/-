package com.itssky.modules.test.controller;

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
import com.itssky.modules.test.domain.TestTest;
import com.itssky.modules.test.service.ITestTestService;
import com.itssky.modules.common.core.web.controller.BaseController;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.core.utils.poi.ExcelUtil;
import com.itssky.modules.common.core.web.page.TableDataInfo;

/**
 * testController
 * 
 * @author itssky
 * @date 2021-05-10
 */
@RestController
@RequestMapping("/test/test")
public class TestTestController extends BaseController
{

    /**
     * 请求路径
     */
    private final static String REQUEST_PATH = "com.itssky.modules.test.test.test";

    @Autowired
    private ITestTestService testTestService;

    /**
     * 查询test列表
     */
    @PreAuthorize("@ss.hasPermi('test:test:list')")
    @GetMapping("/list")
    public TableDataInfo list(TestTest testTest)
    {
        startPage();
        List<TestTest> list = testTestService.selectTestTestList(testTest);
        List<ParticleTableColumn> columns = ParticleUtils.getParticleTableColumns(REQUEST_PATH);
        return getDynamicDataTable(list,columns);
    }

    /**
     * 获取test详细信息
     */
    @PreAuthorize("@ss.hasPermi('test:test:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(testTestService.selectTestTestById(id));
    }

    /**
     * 导出test列表
     */
    @PreAuthorize("@ss.hasPermi('test:test:export')")
    @Log(title = "test", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TestTest testTest)
    {
        List<TestTest> list = testTestService.selectTestTestList(testTest);
        ExcelUtil<TestTest> util = new ExcelUtil<TestTest>(TestTest.class);
        return util.exportExcel(list, "test");
    }

    /**
     * 新增test
     */
    @PreAuthorize("@ss.hasPermi('test:test:add')")
    @Log(title = "test", businessType = BusinessType.INSERT)
    @PostMapping
    @RepeatSubmit
    public AjaxResult add(@RequestBody TestTest testTest)
    {
        return toAjax(testTestService.insertTestTest(testTest));
    }

    /**
     * 修改test
     */
    @PreAuthorize("@ss.hasPermi('test:test:edit')")
    @Log(title = "test", businessType = BusinessType.UPDATE)
    @PutMapping
    @RepeatSubmit
    public AjaxResult edit(@RequestBody TestTest testTest)
    {
        return toAjax(testTestService.updateTestTest(testTest));
    }

    /**
     * 删除test
     */
    @PreAuthorize("@ss.hasPermi('test:test:remove')")
    @Log(title = "test", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(testTestService.deleteLogicTestTestByIds(ids));
    }
}
