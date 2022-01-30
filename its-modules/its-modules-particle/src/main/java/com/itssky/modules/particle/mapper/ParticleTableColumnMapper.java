package com.itssky.modules.particle.mapper;

import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;

import java.util.List;

/**
 * 数据清单字段Mapper接口
 * 
 * @author itssky
 * @date 2021-04-24
 */
public interface ParticleTableColumnMapper 
{
    /**
     * 查询数据清单字段
     * 
     * @param columnId 数据清单字段ID
     * @return 数据清单字段
     */
    public ParticleTableColumn selectParticleTableColumnById(Long columnId);

    /**
     * 查询数据清单字段列表
     * 
     * @param particleTableColumn 数据清单字段
     * @return 数据清单字段集合
     */
    public List<ParticleTableColumn> selectParticleTableColumnList(ParticleTableColumn particleTableColumn);

    /**
     * 查询数据清单字段列表
     *
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    public List<ParticleTableColumn> selectParticleTableColumnListByTableId(Long tableId);

    /**
     * 根据表名称查询列信息
     *
     * @param tableName 表名称
     * @return 列信息
     */
    public List<ParticleTableColumn> selectDbTableColumnsByName(String tableName);

    /**
     * 新增数据清单字段
     * 
     * @param particleTableColumn 数据清单字段
     * @return 结果
     */
    public int insertParticleTableColumn(ParticleTableColumn particleTableColumn);

    /**
     * 修改数据清单字段
     * 
     * @param particleTableColumn 数据清单字段
     * @return 结果
     */
    public int updateParticleTableColumn(ParticleTableColumn particleTableColumn);

    /**
     * 删除数据清单字段
     * 
     * @param columnId 数据清单字段ID
     * @return 结果
     */
    public int deleteParticleTableColumnById(Long columnId);

    /**
     * 批量删除数据清单字段
     * 
     * @param columnIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteParticleTableColumnByIds(Long[] columnIds);

    /**
     * 批量删除数据清单字段
     *
     * @param tableIds 需要删除的数据表ID
     * @return 结果
     */
    public int deleteParticleTableColumnByTableIds(Long[] tableIds);

    /**
     * 逻辑删除数据清单字段
     *
     * @param columnId 数据清单字段ID
     * @return 结果
     */
    public int deleteLogicParticleTableColumnById(Long columnId);

    /**
     * 批量逻辑删除数据清单字段
     *
     * @param columnIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteLogicParticleTableColumnByIds(Long[] columnIds);
}
