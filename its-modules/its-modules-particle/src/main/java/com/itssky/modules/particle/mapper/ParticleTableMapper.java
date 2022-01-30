package com.itssky.modules.particle.mapper;

import com.itssky.modules.common.core.web.domain.gen.GenTable;
import com.itssky.modules.common.core.web.domain.particle.ParticleTable;

import java.util.List;

/**
 * 数据清单Mapper接口
 * 
 * @author itssky
 * @date 2021-04-23
 */
public interface ParticleTableMapper 
{
    /**
     * 查询数据清单
     * 
     * @param tableId 数据清单ID
     * @return 数据清单
     */
    public ParticleTable selectParticleTableById(Long tableId);

    /**
     * 查询数据清单
     *
     * @param tableId 数据清单ID
     * @param roleId  角色ID
     * @return 数据清单
     */
    public ParticleTable selectParticleTableByIdAndRoleId(Long tableId,Long roleId);

    /**
     * 查询数据清单信息
     *
     * @param requestMapping 请求路径
     * @return 数据清单
     */
    public ParticleTable selectParticleTableByRequestPath(String requestMapping);

    /**
     * 查询数据清单信息
     *
     * @param requestPath 请求路径
     * @param roleId 用户编号
     * @return 数据清单
     */
    public ParticleTable selectParticleTableByRequestPathAndRoleId(String requestPath,Long roleId);

    /**
     * 查询数据清单列表
     * 
     * @param particleTable 数据清单
     * @return 数据清单集合
     */
    public List<ParticleTable> selectParticleTableList(ParticleTable particleTable);

    /**
     * 查询gen业务表
     *
     * @param particleTable 数据清单
     * @return 数据库表集合
     */
    public List<ParticleTable> selectGenTableList(ParticleTable particleTable);

    /**
     * 查询gen业务表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    public List<ParticleTable> selectGenTableListByNames(String[] tableNames);

    /**
     * 新增数据清单
     * 
     * @param particleTable 数据清单
     * @return 结果
     */
    public int insertParticleTable(ParticleTable particleTable);

    /**
     * 修改数据清单
     * 
     * @param particleTable 数据清单
     * @return 结果
     */
    public int updateParticleTable(ParticleTable particleTable);

    /**
     * 删除数据清单
     * 
     * @param tableId 数据清单ID
     * @return 结果
     */
    public int deleteParticleTableById(Long tableId);

    /**
     * 批量删除数据清单
     * 
     * @param tableIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteParticleTableByIds(Long[] tableIds);

    /**
     * 逻辑删除数据清单
     *
     * @param tableId 数据清单ID
     * @return 结果
     */
    public int deleteLogicParticleTableById(Long tableId);

    /**
     * 批量逻辑删除数据清单
     *
     * @param tableIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteLogicParticleTableByIds(Long[] tableIds);
}
