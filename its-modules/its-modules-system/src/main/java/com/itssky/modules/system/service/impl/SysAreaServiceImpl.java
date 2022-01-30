package com.itssky.modules.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itssky.modules.system.mapper.SysAreaMapper;
import com.itssky.modules.system.domain.SysArea;
import com.itssky.modules.system.service.ISysAreaService;

/**
 * 区域Service业务层处理
 * 
 * @author itssky
 * @date 2021-05-04
 */
@Service
public class SysAreaServiceImpl implements ISysAreaService 
{
    @Autowired
    private SysAreaMapper sysAreaMapper;

    /**
     * 查询区域
     * 
     * @param id 区域ID
     * @return 区域
     */
    @Override
    public SysArea selectSysAreaById(String id)
    {
        return sysAreaMapper.selectSysAreaById(id);
    }

    /**
     * 查询区域列表
     * 
     * @param sysArea 区域
     * @return 区域
     */
    @Override
    public List<SysArea> selectSysAreaList(SysArea sysArea)
    {
        return sysAreaMapper.selectSysAreaList(sysArea);
    }

    /**
     * 新增区域
     * 
     * @param sysArea 区域
     * @return 结果
     */
    @Override
    public int insertSysArea(SysArea sysArea)
    {
        return sysAreaMapper.insertSysArea(sysArea);
    }

    /**
     * 修改区域
     * 
     * @param sysArea 区域
     * @return 结果
     */
    @Override
    public int updateSysArea(SysArea sysArea)
    {
        return sysAreaMapper.updateSysArea(sysArea);
    }

    /**
     * 批量删除区域
     * 
     * @param ids 需要删除的区域ID
     * @return 结果
     */
    @Override
    public int deleteSysAreaByIds(String[] ids)
    {
        return sysAreaMapper.deleteSysAreaByIds(ids);
    }

    /**
     * 删除区域信息
     * 
     * @param id 区域ID
     * @return 结果
     */
    @Override
    public int deleteSysAreaById(String id)
    {
        return sysAreaMapper.deleteSysAreaById(id);
    }

    /**
     * 逻辑删除区域信息
     *
     * @param id 区域ID
     * @return 结果
     */
    @Override
    public int deleteLogicSysAreaById(String id)
    {
        return sysAreaMapper.deleteLogicSysAreaById(id);
    }

    /**
     * 批量逻辑删除区域
     *
     * @param ids 需要删除的区域ID
     * @return 结果
     */
    @Override
    public int deleteLogicSysAreaByIds(String[] ids)
    {
        return sysAreaMapper.deleteLogicSysAreaByIds(ids);
    }
}
