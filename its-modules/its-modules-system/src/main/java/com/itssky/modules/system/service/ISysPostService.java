package com.itssky.modules.system.service;


import com.itssky.modules.system.domain.SysPost;

import java.util.List;

/**
 * 用户组信息 服务层
 * 
 * @author ITS
 */
public interface ISysPostService
{
    /**
     * 查询用户组信息集合
     * 
     * @param post 用户组信息
     * @return 用户组列表
     */
    public List<SysPost> selectPostList(SysPost post);

    /**
     * 查询所有用户组
     * 
     * @return 用户组列表
     */
    public List<SysPost> selectPostAll();

    /**
     * 通过用户组ID查询用户组信息
     * 
     * @param postId 用户组ID
     * @return 角色对象信息
     */
    public SysPost selectPostById(Long postId);

    /**
     * 根据用户ID获取用户组选择框列表
     * 
     * @param userId 用户ID
     * @return 选中用户组ID列表
     */
    public List<Integer> selectPostListByUserId(Long userId);

    /**
     * 校验用户组名称
     * 
     * @param post 用户组信息
     * @return 结果
     */
    public String checkPostNameUnique(SysPost post);

    /**
     * 校验用户组编码
     * 
     * @param post 用户组信息
     * @return 结果
     */
    public String checkPostCodeUnique(SysPost post);

    /**
     * 通过用户组ID查询用户组使用数量
     * 
     * @param postId 用户组ID
     * @return 结果
     */
    public int countUserPostById(Long postId);

    /**
     * 删除用户组信息
     * 
     * @param postId 用户组ID
     * @return 结果
     */
    public int deletePostById(Long postId);

    /**
     * 批量删除用户组信息
     * 
     * @param postIds 需要删除的用户组ID
     * @return 结果
     * @throws Exception 异常
     */
    public int deletePostByIds(Long[] postIds);

    /**
     * 新增保存用户组信息
     * 
     * @param post 用户组信息
     * @return 结果
     */
    public int insertPost(SysPost post);

    /**
     * 修改保存用户组信息
     * 
     * @param post 用户组信息
     * @return 结果
     */
    public int updatePost(SysPost post);
}
