package com.itssky.modules.demo.service;

import java.util.List;
import com.itssky.modules.demo.domain.DemoVitae;

/**
 * 简历信息Service接口
 * 
 * @author itssky
 * @date 2021-03-12
 */
public interface IDemoVitaeService
{
    /**
     * 查询简历信息
     * 
     * @param vitaeId 简历信息ID
     * @return 简历信息
     */
    public DemoVitae selectDemoVitaeById(Long vitaeId);

    /**
     * 查询简历信息列表
     * 
     * @param demoVitae 简历信息
     * @return 简历信息集合
     */
    public List<DemoVitae> selectDemoVitaeList(DemoVitae demoVitae);

    /**
     * 新增简历信息
     * 
     * @param demoVitae 简历信息
     * @return 结果
     */
    public int insertDemoVitae(DemoVitae demoVitae);

    /**
     * 修改简历信息
     * 
     * @param demoVitae 简历信息
     * @return 结果
     */
    public int updateDemoVitae(DemoVitae demoVitae);

    /**
     * 批量删除简历信息
     * 
     * @param vitaeIds 需要删除的简历信息ID
     * @return 结果
     */
    public int deleteDemoVitaeByIds(Long[] vitaeIds);

    /**
     * 删除简历信息信息
     * 
     * @param vitaeId 简历信息ID
     * @return 结果
     */
    public int deleteDemoVitaeById(Long vitaeId);

    /**
     * 逻辑删除简历信息信息
     *
     * @param vitaeId 简历信息ID
     * @return 结果
     */
    public int deleteLogicDemoVitaeById(Long vitaeId);

    /**
     * 批量逻辑删除简历信息
     *
     * @param vitaeIds 需要删除的简历信息ID
     * @return 结果
     */
    public int deleteLogicDemoVitaeByIds(Long[] vitaeIds);

}
