package com.itssky.modules.system.mapper;

import java.util.List;
import com.itssky.modules.system.domain.SysArea;

/**
 * 区域Mapper接口
 * 
 * @author itssky
 * @date 2021-05-04
 */
public interface SysAreaMapper 
{
    /**
     * 查询区域
     * 
     * @param id 区域ID
     * @return 区域
     */
    public SysArea selectSysAreaById(String id);

    /**
     * 查询区域列表
     * 
     * @param sysArea 区域
     * @return 区域集合
     */
    public List<SysArea> selectSysAreaList(SysArea sysArea);

    /**
     * 新增区域
     * 
     * @param sysArea 区域
     * @return 结果
     */
    public int insertSysArea(SysArea sysArea);

    /**
     * 修改区域
     * 
     * @param sysArea 区域
     * @return 结果
     */
    public int updateSysArea(SysArea sysArea);

    /**
     * 删除区域
     * 
     * @param id 区域ID
     * @return 结果
     */
    public int deleteSysAreaById(String id);

    /**
     * 批量删除区域
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysAreaByIds(String[] ids);

    /**
     * 逻辑删除区域
     *
     * @param id 区域ID
     * @return 结果
     */
    public int deleteLogicSysAreaById(String id);

    /**
     * 批量逻辑删除区域
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLogicSysAreaByIds(String[] ids);
}
