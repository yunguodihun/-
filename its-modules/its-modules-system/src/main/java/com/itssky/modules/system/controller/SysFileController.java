package com.itssky.modules.system.controller;

import java.util.List;

import com.itssky.modules.common.security.domain.SysFile;
import com.itssky.modules.common.security.service.ISysFileService;
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
 * 文件存储Controller
 * 
 * @author itssky
 * @date 2020-12-23
 */
@RestController
@RequestMapping("/system/file")
public class SysFileController extends BaseController
{
    @Autowired
    private ISysFileService sysFileService;




    /**
     * 根据业务主键获取文件存储详细信息
     */
    @GetMapping(value = "/getFilesBySearchId")
    public AjaxResult getFilesBySearchId(Long searchId)
    {
        return AjaxResult.success(sysFileService.selectSysFileBySearchId(searchId));
    }

    /**
     * 查询文件存储列表
     */
    @PreAuthorize("@ss.hasPermi('system:file:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysFile sysFile)
    {
        startPage();
        List<SysFile> list = sysFileService.selectSysFileList(sysFile);
        return getDataTable(list);
    }

    /**
     * 获取文件存储详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:file:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(sysFileService.selectSysFileById(id));
    }

    /**
     * 导出文件存储列表
     */
    @PreAuthorize("@ss.hasPermi('system:file:export')")
    @Log(title = "文件存储", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysFile sysFile)
    {
        List<SysFile> list = sysFileService.selectSysFileList(sysFile);
        ExcelUtil<SysFile> util = new ExcelUtil<SysFile>(SysFile.class);
        return util.exportExcel(list, "file");
    }

    /**
     * 新增文件存储
     */
    @PreAuthorize("@ss.hasPermi('system:file:add')")
    @Log(title = "文件存储", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysFile sysFile)
    {
        return toAjax(sysFileService.insertSysFile(sysFile));
    }

    /**
     * 修改文件存储
     */
    @PreAuthorize("@ss.hasPermi('system:file:edit')")
    @Log(title = "文件存储", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysFile sysFile)
    {
        return toAjax(sysFileService.updateSysFile(sysFile));
    }

    /**
     * 删除文件存储
     */
    @PreAuthorize("@ss.hasPermi('system:file:remove')")
    @Log(title = "文件存储", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysFileService.deleteLogicSysFileByIds(ids));
    }
}
