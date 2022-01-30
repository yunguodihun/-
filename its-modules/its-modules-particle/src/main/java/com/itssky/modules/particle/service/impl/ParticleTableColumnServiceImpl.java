package com.itssky.modules.particle.service.impl;

import java.util.List;
import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.particle.mapper.ParticleTableColumnMapper;
import com.itssky.modules.particle.service.IParticleTableColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 数据清单字段Service业务层处理
 * 
 * @author itssky
 * @date 2021-04-24
 */
@Service
public class ParticleTableColumnServiceImpl implements IParticleTableColumnService
{
    @Autowired
    private ParticleTableColumnMapper particleTableColumnMapper;

    /**
     * 查询数据清单字段
     * 
     * @param columnId 数据清单字段ID
     * @return 数据清单字段
     */
    @Override
    public ParticleTableColumn selectParticleTableColumnById(Long columnId)
    {
        return particleTableColumnMapper.selectParticleTableColumnById(columnId);
    }

    /**
     * 查询数据清单字段列表
     * 
     * @param particleTableColumn 数据清单字段
     * @return 数据清单字段
     */
    @Override
    public List<ParticleTableColumn> selectParticleTableColumnList(ParticleTableColumn particleTableColumn)
    {
        return particleTableColumnMapper.selectParticleTableColumnList(particleTableColumn);
    }

    /**
     * 查询数据清单字段列表
     *
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    @Override
    public List<ParticleTableColumn> selectParticleTableColumnListByTableId(Long tableId) {
        return particleTableColumnMapper.selectParticleTableColumnListByTableId(tableId);
    }

    /**
     * 新增数据清单字段
     * 
     * @param particleTableColumn 数据清单字段
     * @return 结果
     */
    @Override
    public int insertParticleTableColumn(ParticleTableColumn particleTableColumn)
    {
        particleTableColumn.setCreateTime(DateUtils.getNowDate());
        return particleTableColumnMapper.insertParticleTableColumn(particleTableColumn);
    }

    /**
     * 修改数据清单字段
     * 
     * @param particleTableColumn 数据清单字段
     * @return 结果
     */
    @Override
    public int updateParticleTableColumn(ParticleTableColumn particleTableColumn)
    {
        particleTableColumn.setUpdateTime(DateUtils.getNowDate());
        return particleTableColumnMapper.updateParticleTableColumn(particleTableColumn);
    }

    /**
     * 批量删除数据清单字段
     * 
     * @param columnIds 需要删除的数据清单字段ID
     * @return 结果
     */
    @Override
    public int deleteParticleTableColumnByIds(Long[] columnIds)
    {
        return particleTableColumnMapper.deleteParticleTableColumnByIds(columnIds);
    }

    /**
     * 删除数据清单字段信息
     * 
     * @param columnId 数据清单字段ID
     * @return 结果
     */
    @Override
    public int deleteParticleTableColumnById(Long columnId)
    {
        return particleTableColumnMapper.deleteParticleTableColumnById(columnId);
    }

    /**
     * 逻辑删除数据清单字段信息
     *
     * @param columnId 数据清单字段ID
     * @return 结果
     */
    @Override
    public int deleteLogicParticleTableColumnById(Long columnId)
    {
        return particleTableColumnMapper.deleteLogicParticleTableColumnById(columnId);
    }

    /**
     * 批量逻辑删除数据清单字段
     *
     * @param columnIds 需要删除的数据清单字段ID
     * @return 结果
     */
    @Override
    public int deleteLogicParticleTableColumnByIds(Long[] columnIds)
    {
        return particleTableColumnMapper.deleteLogicParticleTableColumnByIds(columnIds);
    }
}
