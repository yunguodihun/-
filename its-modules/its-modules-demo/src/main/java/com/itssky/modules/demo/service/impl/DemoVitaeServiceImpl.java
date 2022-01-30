package com.itssky.modules.demo.service.impl;

import java.util.List;
import com.itssky.modules.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itssky.modules.demo.mapper.DemoVitaeMapper;
import com.itssky.modules.demo.domain.DemoVitae;
import com.itssky.modules.demo.service.IDemoVitaeService;

/**
 * 简历信息Service业务层处理
 * 
 * @author itssky
 * @date 2021-03-12
 */
@Service
public class DemoVitaeServiceImpl implements IDemoVitaeService
{
    @Autowired
    private DemoVitaeMapper demoVitaeMapper;

    /**
     * 查询简历信息
     * 
     * @param vitaeId 简历信息ID
     * @return 简历信息
     */
    @Override
    public DemoVitae selectDemoVitaeById(Long vitaeId)
    {
        return demoVitaeMapper.selectDemoVitaeById(vitaeId);
    }

    /**
     * 查询简历信息列表
     * 
     * @param demoVitae 简历信息
     * @return 简历信息
     */
    @Override
    public List<DemoVitae> selectDemoVitaeList(DemoVitae demoVitae)
    {
        return demoVitaeMapper.selectDemoVitaeList(demoVitae);
    }

    /**
     * 新增简历信息
     * 
     * @param demoVitae 简历信息
     * @return 结果
     */
    @Override
    public int insertDemoVitae(DemoVitae demoVitae)
    {
        demoVitae.preInsert();
        return demoVitaeMapper.insertDemoVitae(demoVitae);
    }

    /**
     * 修改简历信息
     * 
     * @param demoVitae 简历信息
     * @return 结果
     */
    @Override
    public int updateDemoVitae(DemoVitae demoVitae)
    {
        demoVitae.preUpdate();
        return demoVitaeMapper.updateDemoVitae(demoVitae);
    }

    /**
     * 批量删除简历信息
     * 
     * @param vitaeIds 需要删除的简历信息ID
     * @return 结果
     */
    @Override
    public int deleteDemoVitaeByIds(Long[] vitaeIds)
    {
        return demoVitaeMapper.deleteDemoVitaeByIds(vitaeIds);
    }

    /**
     * 删除简历信息信息
     * 
     * @param vitaeId 简历信息ID
     * @return 结果
     */
    @Override
    public int deleteDemoVitaeById(Long vitaeId)
    {
        return demoVitaeMapper.deleteDemoVitaeById(vitaeId);
    }

    /**
     * 逻辑删除简历信息信息
     *
     * @param vitaeId 简历信息ID
     * @return 结果
     */
    @Override
    public int deleteLogicDemoVitaeById(Long vitaeId)
    {
        return demoVitaeMapper.deleteLogicDemoVitaeById(vitaeId);
    }

    /**
     * 批量逻辑删除简历信息
     *
     * @param vitaeIds 需要删除的简历信息ID
     * @return 结果
     */
    @Override
    public int deleteLogicDemoVitaeByIds(Long[] vitaeIds)
    {
        return demoVitaeMapper.deleteLogicDemoVitaeByIds(vitaeIds);
    }
}
