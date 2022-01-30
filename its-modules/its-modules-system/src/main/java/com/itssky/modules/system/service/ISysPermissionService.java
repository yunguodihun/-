package com.itssky.modules.system.service;


import com.itssky.modules.common.security.domain.SysUser;

import java.util.Set;

/**
 * 权限 服务层
 *
 * @author ITS
 */
public interface ISysPermissionService
{
    /**
     * 获取角色数据权限
     * 
     * @param user 用户信息
     * @return 角色权限信息
     */
    public Set<String> getRolePermission(SysUser user);

    /**
     * 获取菜单数据权限
     * 
     * @param user 用户信息
     * @return 菜单权限信息
     */
    public Set<String> getMenuPermission(SysUser user);
}
