package com.itssky.modules.common.security.service.impl;

import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.security.domain.SysFile;
import com.itssky.modules.common.security.mapper.SysFileMapper;
import com.itssky.modules.common.security.service.ISysFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文件存储Service业务层处理
 * 
 * @author itssky
 * @date 2020-12-23
 */
@Service
public class SysFileServiceImpl implements ISysFileService
{
    @Autowired
    private SysFileMapper sysFileMapper;

    /**
     * 查询文件存储
     * 
     * @param id 文件存储ID
     * @return 文件存储
     */
    @Override
    public SysFile selectSysFileById(Long id)
    {
        return sysFileMapper.selectSysFileById(id);
    }

    /**
     * 根据业务主键查询文件存储
     *
     * @param searchId 业务主键
     * @return 文件存储
     */
    @Override
    public List<SysFile> selectSysFileBySearchId(Long searchId) {
        return sysFileMapper.selectSysFileBySearchId(searchId);
    }

    /**
     * 查询文件存储列表
     * 
     * @param sysFile 文件存储
     * @return 文件存储
     */
    @Override
    public List<SysFile> selectSysFileList(SysFile sysFile)
    {
        return sysFileMapper.selectSysFileList(sysFile);
    }

    /**
     * 新增文件存储
     * 
     * @param sysFile 文件存储
     * @return 结果
     */
    @Override
    public int insertSysFile(SysFile sysFile)
    {
        sysFile.setCreateTime(DateUtils.getNowDate());
        return sysFileMapper.insertSysFile(sysFile);
    }

    /**
     * 修改文件存储
     * 
     * @param sysFile 文件存储
     * @return 结果
     */
    @Override
    public int updateSysFile(SysFile sysFile)
    {
        sysFile.setUpdateTime(DateUtils.getNowDate());
        return sysFileMapper.updateSysFile(sysFile);
    }

    /**
     * 批量删除文件存储
     * 
     * @param ids 需要删除的文件存储ID
     * @return 结果
     */
    @Override
    public int deleteSysFileByIds(Long[] ids)
    {
        return sysFileMapper.deleteSysFileByIds(ids);
    }

    /**
     * 删除文件存储信息
     * 
     * @param id 文件存储ID
     * @return 结果
     */
    @Override
    public int deleteSysFileById(Long id)
    {
        return sysFileMapper.deleteSysFileById(id);
    }

    /**
     * 逻辑删除文件存储信息
     *
     * @param id 文件存储ID
     * @return 结果
     */
    @Override
    public int deleteLogicSysFileById(Long id)
    {
        return sysFileMapper.deleteLogicSysFileById(id);
    }

    /**
     * 批量逻辑删除文件存储
     *
     * @param ids 需要删除的文件存储ID
     * @return 结果
     */
    @Override
    public int deleteLogicSysFileByIds(Long[] ids)
    {
        return sysFileMapper.deleteLogicSysFileByIds(ids);
    }
}
