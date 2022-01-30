package com.itssky.modules.test.service.impl;

import java.util.List;
import com.itssky.modules.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itssky.modules.test.mapper.TestTestMapper;
import com.itssky.modules.test.domain.TestTest;
import com.itssky.modules.test.service.ITestTestService;

/**
 * testService业务层处理
 * 
 * @author itssky
 * @date 2021-05-10
 */
@Service
public class TestTestServiceImpl implements ITestTestService 
{
    @Autowired
    private TestTestMapper testTestMapper;

    /**
     * 查询test
     * 
     * @param id testID
     * @return test
     */
    @Override
    public TestTest selectTestTestById(Long id)
    {
        return testTestMapper.selectTestTestById(id);
    }

    /**
     * 查询test列表
     * 
     * @param testTest test
     * @return test
     */
    @Override
    public List<TestTest> selectTestTestList(TestTest testTest)
    {
        return testTestMapper.selectTestTestList(testTest);
    }

    /**
     * 新增test
     * 
     * @param testTest test
     * @return 结果
     */
    @Override
    public int insertTestTest(TestTest testTest)
    {
        testTest.setCreateTime(DateUtils.getNowDate());
        return testTestMapper.insertTestTest(testTest);
    }

    /**
     * 修改test
     * 
     * @param testTest test
     * @return 结果
     */
    @Override
    public int updateTestTest(TestTest testTest)
    {
        testTest.setUpdateTime(DateUtils.getNowDate());
        return testTestMapper.updateTestTest(testTest);
    }

    /**
     * 批量删除test
     * 
     * @param ids 需要删除的testID
     * @return 结果
     */
    @Override
    public int deleteTestTestByIds(Long[] ids)
    {
        return testTestMapper.deleteTestTestByIds(ids);
    }

    /**
     * 删除test信息
     * 
     * @param id testID
     * @return 结果
     */
    @Override
    public int deleteTestTestById(Long id)
    {
        return testTestMapper.deleteTestTestById(id);
    }

    /**
     * 逻辑删除test信息
     *
     * @param id testID
     * @return 结果
     */
    @Override
    public int deleteLogicTestTestById(Long id)
    {
        return testTestMapper.deleteLogicTestTestById(id);
    }

    /**
     * 批量逻辑删除test
     *
     * @param ids 需要删除的testID
     * @return 结果
     */
    @Override
    public int deleteLogicTestTestByIds(Long[] ids)
    {
        return testTestMapper.deleteLogicTestTestByIds(ids);
    }
}
