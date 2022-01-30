package com.itssky.modules.particle.service.impl;

import java.util.List;
import com.itssky.modules.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itssky.modules.particle.mapper.ParticleConfigMapper;
import com.itssky.modules.particle.domain.ParticleConfig;
import com.itssky.modules.particle.service.IParticleConfigService;

/**
 * 颗粒配置Service业务层处理
 * 
 * @author itssky
 * @date 2021-04-29
 */
@Service
public class ParticleConfigServiceImpl implements IParticleConfigService 
{
    @Autowired
    private ParticleConfigMapper particleConfigMapper;

    /**
     * 查询颗粒配置
     * 
     * @param configId 颗粒配置ID
     * @return 颗粒配置
     */
    @Override
    public ParticleConfig selectParticleConfigById(Long configId)
    {
        return particleConfigMapper.selectParticleConfigById(configId);
    }

    /**
     * 查询颗粒配置列表
     * 
     * @param particleConfig 颗粒配置
     * @return 颗粒配置
     */
    @Override
    public List<ParticleConfig> selectParticleConfigList(ParticleConfig particleConfig)
    {
        return particleConfigMapper.selectParticleConfigList(particleConfig);
    }

    /**
     * 新增颗粒配置
     * 
     * @param particleConfig 颗粒配置
     * @return 结果
     */
    @Override
    public int insertParticleConfig(ParticleConfig particleConfig)
    {
        particleConfig.setCreateTime(DateUtils.getNowDate());
        return particleConfigMapper.insertParticleConfig(particleConfig);
    }

    /**
     * 修改颗粒配置
     * 
     * @param particleConfig 颗粒配置
     * @return 结果
     */
    @Override
    public int updateParticleConfig(ParticleConfig particleConfig)
    {
        particleConfig.setUpdateTime(DateUtils.getNowDate());
        return particleConfigMapper.updateParticleConfig(particleConfig);
    }

    /**
     * 批量删除颗粒配置
     * 
     * @param configIds 需要删除的颗粒配置ID
     * @return 结果
     */
    @Override
    public int deleteParticleConfigByIds(Long[] configIds)
    {
        return particleConfigMapper.deleteParticleConfigByIds(configIds);
    }

    /**
     * 删除颗粒配置信息
     * 
     * @param configId 颗粒配置ID
     * @return 结果
     */
    @Override
    public int deleteParticleConfigById(Long configId)
    {
        return particleConfigMapper.deleteParticleConfigById(configId);
    }

    /**
     * 逻辑删除颗粒配置信息
     *
     * @param configId 颗粒配置ID
     * @return 结果
     */
    @Override
    public int deleteLogicParticleConfigById(Long configId)
    {
        return particleConfigMapper.deleteLogicParticleConfigById(configId);
    }

    /**
     * 批量逻辑删除颗粒配置
     *
     * @param configIds 需要删除的颗粒配置ID
     * @return 结果
     */
    @Override
    public int deleteLogicParticleConfigByIds(Long[] configIds)
    {
        return particleConfigMapper.deleteLogicParticleConfigByIds(configIds);
    }
}
