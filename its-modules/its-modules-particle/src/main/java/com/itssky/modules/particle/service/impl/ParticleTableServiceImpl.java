package com.itssky.modules.particle.service.impl;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.itssky.modules.common.core.constant.GenConstants;
import com.itssky.modules.common.core.exception.CustomException;
import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.utils.StringUtils;
import com.itssky.modules.common.core.web.domain.gen.GenTable;
import com.itssky.modules.common.core.web.domain.gen.GenTableColumn;
import com.itssky.modules.common.core.web.domain.particle.ParticleTable;
import com.itssky.modules.common.core.web.domain.particle.ParticleTableColumn;
import com.itssky.modules.common.security.utils.SecurityUtils;
import com.itssky.modules.gen.util.GenUtils;
import com.itssky.modules.particle.mapper.ParticleTableColumnMapper;
import com.itssky.modules.particle.util.ParticleUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itssky.modules.particle.mapper.ParticleTableMapper;
import com.itssky.modules.particle.service.IParticleTableService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 数据清单Service业务层处理
 * 
 * @author itssky
 * @date 2021-04-23
 */
@Service
public class ParticleTableServiceImpl implements IParticleTableService 
{
    @Autowired
    private ParticleTableMapper particleTableMapper;

    @Autowired
    private ParticleTableColumnMapper particleTableColumnMapper;

    /**
     * 查询数据清单
     * 
     * @param tableId 数据清单ID
     * @return 数据清单
     */
    @Override
    public ParticleTable selectParticleTableById(Long tableId)
    {
        ParticleTable particleTable = particleTableMapper.selectParticleTableById(tableId);
        setTableFromOptions(particleTable);
        return particleTable;
    }

    /**
     * 查询数据清单
     *
     * @param tableId 数据清单ID
     * @param roleId  角色ID
     * @return 数据清单
     */
    @Override
    public ParticleTable selectParticleTableByIdAndRoleId(Long tableId, Long roleId) {
        ParticleTable particleTable = particleTableMapper.selectParticleTableByIdAndRoleId(tableId,roleId);
        setTableFromOptions(particleTable);
        return particleTable;
    }

    /**
     * 查询数据清单信息
     *
     * @param requestMapping 请求路径
     * @return 数据清单
     */
    @Override
    public ParticleTable selectParticleTableByRequestPath(String requestMapping) {
        return particleTableMapper.selectParticleTableByRequestPath(requestMapping);
    }

    /**
     * 查询数据清单信息
     *
     * @param requestPath 请求路径
     * @param roleId 用户编号
     * @return 数据清单
     */
    @Override
    public ParticleTable selectParticleTableByRequestPathAndRoleId(String requestPath,Long roleId) {
        return particleTableMapper.selectParticleTableByRequestPathAndRoleId(requestPath,roleId);
    }

    /**
     * 查询数据清单列表
     * 
     * @param particleTable 数据清单
     * @return 数据清单
     */
    @Override
    public List<ParticleTable> selectParticleTableList(ParticleTable particleTable)
    {
        return particleTableMapper.selectParticleTableList(particleTable);
    }

    /**
     * 查询gen业务表
     *
     * @param particleTable 数据清单
     * @return 数据库表集合
     */
    @Override
    public List<ParticleTable> selectGenTableList(ParticleTable particleTable) {
        return particleTableMapper.selectGenTableList(particleTable);
    }

    /**
     * 查询gen业务表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    @Override
    public List<ParticleTable> selectGenTableListByNames(String[] tableNames) {
        return particleTableMapper.selectGenTableListByNames(tableNames);
    }

    /**
     * 新增数据清单
     * 
     * @param particleTable 数据清单
     * @return 结果
     */
    @Override
    public int insertParticleTable(ParticleTable particleTable)
    {
        particleTable.setCreateTime(DateUtils.getNowDate());
        return particleTableMapper.insertParticleTable(particleTable);
    }

    /**
     * 修改数据清单
     * 
     * @param particleTable 数据清单
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateParticleTable(ParticleTable particleTable)
    {
        String options = JSON.toJSONString(particleTable.getParams());
        particleTable.setOptions(options);
        int row = particleTableMapper.updateParticleTable(particleTable);
        if (row > 0)
        {
            for (ParticleTableColumn particleTableColumn : particleTable.getColumns())
            {
                particleTableColumnMapper.updateParticleTableColumn(particleTableColumn);
            }
        }
    }

    /**
     * 批量删除数据清单
     * 
     * @param tableIds 需要删除的数据清单ID
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteParticleTableByIds(Long[] tableIds)
    {
        particleTableMapper.deleteParticleTableByIds(tableIds);
        particleTableColumnMapper.deleteParticleTableColumnByTableIds(tableIds);
    }

    /**
     * 删除数据清单信息
     * 
     * @param tableId 数据清单ID
     * @return 结果
     */
    @Override
    public int deleteParticleTableById(Long tableId)
    {
        return particleTableMapper.deleteParticleTableById(tableId);
    }

    /**
     * 逻辑删除数据清单信息
     *
     * @param tableId 数据清单ID
     * @return 结果
     */
    @Override
    public int deleteLogicParticleTableById(Long tableId)
    {
        return particleTableMapper.deleteLogicParticleTableById(tableId);
    }

    /**
     * 批量逻辑删除数据清单
     *
     * @param tableIds 需要删除的数据清单ID
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteLogicParticleTableByIds(Long[] tableIds)
    {
        particleTableMapper.deleteLogicParticleTableByIds(tableIds);
        particleTableColumnMapper.deleteLogicParticleTableColumnByIds(tableIds);
    }

    /**
     * 修改保存参数校验
     *
     * @param particleTable 业务信息
     */
    @Override
    public void validateEdit(ParticleTable particleTable)
    {
        if (GenConstants.TPL_TREE.equals(particleTable.getTplCategory()))
        {
            String options = JSON.toJSONString(particleTable.getParams());
            JSONObject paramsObj = JSONObject.parseObject(options);
            if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_CODE)))
            {
                throw new CustomException("树编码字段不能为空");
            }
            else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_PARENT_CODE)))
            {
                throw new CustomException("树父编码字段不能为空");
            }
            else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_NAME)))
            {
                throw new CustomException("树名称字段不能为空");
            }
        }
    }

    /**
     * 设置代码生成其他选项值
     *
     * @param particleTable 设置后的生成对象
     */
    public void setTableFromOptions(ParticleTable particleTable)
    {
        JSONObject paramsObj = JSONObject.parseObject(particleTable.getOptions());
        if (StringUtils.isNotNull(paramsObj))
        {
            String treeCode = paramsObj.getString(GenConstants.TREE_CODE);
            String treeParentCode = paramsObj.getString(GenConstants.TREE_PARENT_CODE);
            String treeName = paramsObj.getString(GenConstants.TREE_NAME);
            String parentMenuId = paramsObj.getString(GenConstants.PARENT_MENU_ID);
            String parentMenuName = paramsObj.getString(GenConstants.PARENT_MENU_NAME);
            particleTable.setTreeCode(treeCode);
            particleTable.setTreeParentCode(treeParentCode);
            particleTable.setTreeName(treeName);
            particleTable.setParentMenuId(parentMenuId);
            particleTable.setParentMenuName(parentMenuName);
        }
    }

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importParticleTable(List<ParticleTable> tableList,Long roleId)
    {
        String operName = SecurityUtils.getUsername();
        try
        {
            for (ParticleTable table : tableList)
            {
                String tableName = table.getTableName();
                ParticleUtils.initTable(table, operName);
                table.setRoleId(roleId);
                int row = particleTableMapper.insertParticleTable(table);
                if (row > 0)
                {
                    // 保存列信息
                    List<ParticleTableColumn> particleTableColumns = particleTableColumnMapper.selectDbTableColumnsByName(tableName);
                    for (ParticleTableColumn column : particleTableColumns)
                    {
                        ParticleUtils.initColumnField(column, table);
                        column.setRoleId(roleId);
                        particleTableColumnMapper.insertParticleTableColumn(column);
                    }
                }
            }
        }
        catch (Exception e)
        {
            throw new CustomException("导入失败：" + e.getMessage());
        }
    }
}
