package com.itssky.modules.common.security.service;


/**
 * 用户组信息 服务层
 * 
 * @author ITS
 */
public interface ISysGroupService
{

    /**
     * 判断用户是否属于该用户组
     * @param userName 用户名
     * @param groupName 用户组名
     * @return true-存在,false-不存在
     */
    public Boolean hasGroupByUserNameAndGroupName(String userName,String groupName);
}
