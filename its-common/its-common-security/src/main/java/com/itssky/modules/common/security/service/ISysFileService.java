package com.itssky.modules.common.security.service;

import com.itssky.modules.common.security.domain.SysFile;

import java.util.List;

/**
 * 文件存储Service接口
 * 
 * @author itssky
 * @date 2020-12-23
 */
public interface ISysFileService
{
    /**
     * 查询文件存储
     * 
     * @param id 文件存储ID
     * @return 文件存储
     */
    public SysFile selectSysFileById(Long id);

    /**
     * 根据业务主键查询文件存储
     *
     * @param searchId 业务主键
     * @return 文件存储
     */
    public List<SysFile> selectSysFileBySearchId(Long searchId);


    /**
     * 查询文件存储列表
     * 
     * @param sysFile 文件存储
     * @return 文件存储集合
     */
    public List<SysFile> selectSysFileList(SysFile sysFile);

    /**
     * 新增文件存储
     * 
     * @param sysFile 文件存储
     * @return 结果
     */
    public int insertSysFile(SysFile sysFile);

    /**
     * 修改文件存储
     * 
     * @param sysFile 文件存储
     * @return 结果
     */
    public int updateSysFile(SysFile sysFile);

    /**
     * 批量删除文件存储
     * 
     * @param ids 需要删除的文件存储ID
     * @return 结果
     */
    public int deleteSysFileByIds(Long[] ids);

    /**
     * 删除文件存储信息
     * 
     * @param id 文件存储ID
     * @return 结果
     */
    public int deleteSysFileById(Long id);

    /**
     * 逻辑删除文件存储信息
     *
     * @param id 文件存储ID
     * @return 结果
     */
    public int deleteLogicSysFileById(Long id);

    /**
     * 批量逻辑删除文件存储
     *
     * @param ids 需要删除的文件存储ID
     * @return 结果
     */
    public int deleteLogicSysFileByIds(Long[] ids);

}
