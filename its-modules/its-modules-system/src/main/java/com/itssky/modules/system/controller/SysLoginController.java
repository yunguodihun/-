package com.itssky.modules.system.controller;

import com.itssky.modules.common.core.constant.Constants;
import com.itssky.modules.common.core.utils.ServletUtils;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.security.domain.LoginBody;
import com.itssky.modules.common.security.domain.LoginUser;
import com.itssky.modules.common.security.domain.SysUser;
import com.itssky.modules.common.security.utils.SysLoginUtil;
import com.itssky.modules.common.security.utils.TokenUtil;
import com.itssky.modules.system.domain.SysMenu;
import com.itssky.modules.system.service.ISysMenuService;
import com.itssky.modules.system.service.ISysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

/**
 * 登录验证
 * 
 * @author ITS
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginUtil sysLoginUtil;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private ISysPermissionService permissionService;

    @Autowired
    private TokenUtil tokenUtil;
    
    /**
     * 登录方法
     *
     * @param loginBody 登陆信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = sysLoginUtil.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        LoginUser loginUser = tokenUtil.getLoginUser(ServletUtils.getRequest());
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        LoginUser loginUser = tokenUtil.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
