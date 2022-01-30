package com.itssky.modules.particle.service;

import java.util.List;
import com.itssky.modules.particle.domain.ParticleConfig;

/**
 * 颗粒配置Service接口
 * 
 * @author itssky
 * @date 2021-04-29
 */
public interface IParticleConfigService 
{
    /**
     * 查询颗粒配置
     * 
     * @param configId 颗粒配置ID
     * @return 颗粒配置
     */
    public ParticleConfig selectParticleConfigById(Long configId);

    /**
     * 查询颗粒配置列表
     * 
     * @param particleConfig 颗粒配置
     * @return 颗粒配置集合
     */
    public List<ParticleConfig> selectParticleConfigList(ParticleConfig particleConfig);

    /**
     * 新增颗粒配置
     * 
     * @param particleConfig 颗粒配置
     * @return 结果
     */
    public int insertParticleConfig(ParticleConfig particleConfig);

    /**
     * 修改颗粒配置
     * 
     * @param particleConfig 颗粒配置
     * @return 结果
     */
    public int updateParticleConfig(ParticleConfig particleConfig);

    /**
     * 批量删除颗粒配置
     * 
     * @param configIds 需要删除的颗粒配置ID
     * @return 结果
     */
    public int deleteParticleConfigByIds(Long[] configIds);

    /**
     * 删除颗粒配置信息
     * 
     * @param configId 颗粒配置ID
     * @return 结果
     */
    public int deleteParticleConfigById(Long configId);

    /**
     * 逻辑删除颗粒配置信息
     *
     * @param configId 颗粒配置ID
     * @return 结果
     */
    public int deleteLogicParticleConfigById(Long configId);

    /**
     * 批量逻辑删除颗粒配置
     *
     * @param configIds 需要删除的颗粒配置ID
     * @return 结果
     */
    public int deleteLogicParticleConfigByIds(Long[] configIds);

}
