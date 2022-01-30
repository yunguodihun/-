package com.itssky.modules.common.security.mapper;

import com.itssky.modules.common.security.domain.SysGroup;

import java.util.List;

/**
 * 用户组信息 数据层
 * 
 * @author ITS
 */
public interface SysGroupMapper
{
    /**
     * 查询用户组数据集合
     * 
     * @param group 用户组信息
     * @return 用户组数据集合
     */
    public List<SysGroup> selectGroupList(SysGroup group);

    /**
     * 查询所有用户组
     * 
     * @return 用户组列表
     */
    public List<SysGroup> selectGroupAll();

    /**
     * 通过用户组ID查询用户组信息
     * 
     * @param groupId 用户组ID
     * @return 角色对象信息
     */
    public SysGroup selectGroupById(Long groupId);

    /**
     * 根据用户ID获取用户组选择框列表
     * 
     * @param userId 用户ID
     * @return 选中用户组ID列表
     */
    public List<Integer> selectGroupListByUserId(Long userId);

    /**
     * 查询用户所属用户组
     * 
     * @param userName 用户名
     * @return 结果
     */
    public List<SysGroup> selectGroupsByUserName(String userName);

    /**
     * 校验用户组名称
     * 
     * @param groupName 用户组名称
     * @return 结果
     */
    public SysGroup checkGroupNameUnique(String groupName);

    /**
     * 校验用户组编码
     * 
     * @param groupCode 用户组编码
     * @return 结果
     */
    public SysGroup checkGroupCodeUnique(String groupCode);
}
