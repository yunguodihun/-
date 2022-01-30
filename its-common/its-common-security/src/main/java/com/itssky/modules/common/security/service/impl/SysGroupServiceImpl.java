package com.itssky.modules.common.security.service.impl;

import com.itssky.modules.common.security.domain.SysGroup;
import com.itssky.modules.common.security.mapper.SysGroupMapper;
import com.itssky.modules.common.security.service.ISysGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户组信息 服务层处理
 * 
 * @author ITS
 */
@Service
public class SysGroupServiceImpl implements ISysGroupService
{
    @Autowired
    private SysGroupMapper groupMapper;


    /**
     * 判断用户是否属于用户组
     * @param userName 用户名
     * @param groupName 用户组名
     * @return 结果
     */
    @Override
    public Boolean hasGroupByUserNameAndGroupName(String userName,String groupName) {
        Boolean hasGroup = false;
        List<SysGroup> list = groupMapper.selectGroupsByUserName(userName);
        for (SysGroup post : list)
        {
            if(groupName.equals(post.getPostName())) {
                hasGroup = true;
                break;
            }
        }
        return hasGroup;
    }
}
