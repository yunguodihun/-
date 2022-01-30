package com.itssky.modules.particle.service;

import com.itssky.modules.common.core.web.domain.gen.GenTableColumn;
import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;

import java.util.List;

/**
 * 数据清单字段Service接口
 * 
 * @author itssky
 * @date 2021-04-24
 */
public interface IParticleTableColumnService 
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
     * 批量删除数据清单字段
     * 
     * @param columnIds 需要删除的数据清单字段ID
     * @return 结果
     */
    public int deleteParticleTableColumnByIds(Long[] columnIds);

    /**
     * 删除数据清单字段信息
     * 
     * @param columnId 数据清单字段ID
     * @return 结果
     */
    public int deleteParticleTableColumnById(Long columnId);

    /**
     * 逻辑删除数据清单字段信息
     *
     * @param columnId 数据清单字段ID
     * @return 结果
     */
    public int deleteLogicParticleTableColumnById(Long columnId);

    /**
     * 批量逻辑删除数据清单字段
     *
     * @param columnIds 需要删除的数据清单字段ID
     * @return 结果
     */
    public int deleteLogicParticleTableColumnByIds(Long[] columnIds);

}
