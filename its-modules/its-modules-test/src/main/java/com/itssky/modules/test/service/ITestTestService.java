package com.itssky.modules.test.service;

import java.util.List;
import com.itssky.modules.test.domain.TestTest;

/**
 * testService接口
 * 
 * @author itssky
 * @date 2021-05-10
 */
public interface ITestTestService 
{
    /**
     * 查询test
     * 
     * @param id testID
     * @return test
     */
    public TestTest selectTestTestById(Long id);

    /**
     * 查询test列表
     * 
     * @param testTest test
     * @return test集合
     */
    public List<TestTest> selectTestTestList(TestTest testTest);

    /**
     * 新增test
     * 
     * @param testTest test
     * @return 结果
     */
    public int insertTestTest(TestTest testTest);

    /**
     * 修改test
     * 
     * @param testTest test
     * @return 结果
     */
    public int updateTestTest(TestTest testTest);

    /**
     * 批量删除test
     * 
     * @param ids 需要删除的testID
     * @return 结果
     */
    public int deleteTestTestByIds(Long[] ids);

    /**
     * 删除test信息
     * 
     * @param id testID
     * @return 结果
     */
    public int deleteTestTestById(Long id);

    /**
     * 逻辑删除test信息
     *
     * @param id testID
     * @return 结果
     */
    public int deleteLogicTestTestById(Long id);

    /**
     * 批量逻辑删除test
     *
     * @param ids 需要删除的testID
     * @return 结果
     */
    public int deleteLogicTestTestByIds(Long[] ids);

}
