package com.itssky.modules.demo.service;

import java.util.List;
import com.itssky.modules.demo.domain.DemoValidation;

/**
 * 验证实例Service接口
 * 
 * @author itssky
 * @date 2021-03-15
 */
public interface IDemoValidationService 
{
    /**
     * 查询验证实例
     * 
     * @param validationId 验证实例ID
     * @return 验证实例
     */
    public DemoValidation selectDemoValidationById(Long validationId);

    /**
     * 查询验证实例列表
     * 
     * @param demoValidation 验证实例
     * @return 验证实例集合
     */
    public List<DemoValidation> selectDemoValidationList(DemoValidation demoValidation);

    /**
     * 新增验证实例
     * 
     * @param demoValidation 验证实例
     * @return 结果
     */
    public int insertDemoValidation(DemoValidation demoValidation);

    /**
     * 修改验证实例
     * 
     * @param demoValidation 验证实例
     * @return 结果
     */
    public int updateDemoValidation(DemoValidation demoValidation);

    /**
     * 批量删除验证实例
     * 
     * @param validationIds 需要删除的验证实例ID
     * @return 结果
     */
    public int deleteDemoValidationByIds(Long[] validationIds);

    /**
     * 删除验证实例信息
     * 
     * @param validationId 验证实例ID
     * @return 结果
     */
    public int deleteDemoValidationById(Long validationId);

    /**
     * 逻辑删除验证实例信息
     *
     * @param validationId 验证实例ID
     * @return 结果
     */
    public int deleteLogicDemoValidationById(Long validationId);

    /**
     * 批量逻辑删除验证实例
     *
     * @param validationIds 需要删除的验证实例ID
     * @return 结果
     */
    public int deleteLogicDemoValidationByIds(Long[] validationIds);

}
