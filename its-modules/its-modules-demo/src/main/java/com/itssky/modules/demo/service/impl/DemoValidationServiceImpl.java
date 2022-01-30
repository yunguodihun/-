package com.itssky.modules.demo.service.impl;

import java.util.List;
import com.itssky.modules.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itssky.modules.demo.mapper.DemoValidationMapper;
import com.itssky.modules.demo.domain.DemoValidation;
import com.itssky.modules.demo.service.IDemoValidationService;

/**
 * 验证实例Service业务层处理
 * 
 * @author itssky
 * @date 2021-03-15
 */
@Service
public class DemoValidationServiceImpl implements IDemoValidationService 
{
    @Autowired
    private DemoValidationMapper demoValidationMapper;

    /**
     * 查询验证实例
     * 
     * @param validationId 验证实例ID
     * @return 验证实例
     */
    @Override
    public DemoValidation selectDemoValidationById(Long validationId)
    {
        return demoValidationMapper.selectDemoValidationById(validationId);
    }

    /**
     * 查询验证实例列表
     * 
     * @param demoValidation 验证实例
     * @return 验证实例
     */
    @Override
    public List<DemoValidation> selectDemoValidationList(DemoValidation demoValidation)
    {
        return demoValidationMapper.selectDemoValidationList(demoValidation);
    }

    /**
     * 新增验证实例
     * 
     * @param demoValidation 验证实例
     * @return 结果
     */
    @Override
    public int insertDemoValidation(DemoValidation demoValidation)
    {
        demoValidation.setCreateTime(DateUtils.getNowDate());
        return demoValidationMapper.insertDemoValidation(demoValidation);
    }

    /**
     * 修改验证实例
     * 
     * @param demoValidation 验证实例
     * @return 结果
     */
    @Override
    public int updateDemoValidation(DemoValidation demoValidation)
    {
        demoValidation.setUpdateTime(DateUtils.getNowDate());
        return demoValidationMapper.updateDemoValidation(demoValidation);
    }

    /**
     * 批量删除验证实例
     * 
     * @param validationIds 需要删除的验证实例ID
     * @return 结果
     */
    @Override
    public int deleteDemoValidationByIds(Long[] validationIds)
    {
        return demoValidationMapper.deleteDemoValidationByIds(validationIds);
    }

    /**
     * 删除验证实例信息
     * 
     * @param validationId 验证实例ID
     * @return 结果
     */
    @Override
    public int deleteDemoValidationById(Long validationId)
    {
        return demoValidationMapper.deleteDemoValidationById(validationId);
    }

    /**
     * 逻辑删除验证实例信息
     *
     * @param validationId 验证实例ID
     * @return 结果
     */
    @Override
    public int deleteLogicDemoValidationById(Long validationId)
    {
        return demoValidationMapper.deleteLogicDemoValidationById(validationId);
    }

    /**
     * 批量逻辑删除验证实例
     *
     * @param validationIds 需要删除的验证实例ID
     * @return 结果
     */
    @Override
    public int deleteLogicDemoValidationByIds(Long[] validationIds)
    {
        return demoValidationMapper.deleteLogicDemoValidationByIds(validationIds);
    }
}
