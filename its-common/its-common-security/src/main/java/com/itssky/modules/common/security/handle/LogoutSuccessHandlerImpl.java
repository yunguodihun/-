package com.itssky.modules.common.security.handle;

import com.alibaba.fastjson.JSON;
import com.itssky.modules.common.core.constant.Constants;
import com.itssky.modules.common.core.constant.HttpStatus;
import com.itssky.modules.common.core.utils.ServletUtils;
import com.itssky.modules.common.core.utils.StringUtils;
import com.itssky.modules.common.core.web.domain.AjaxResult;
import com.itssky.modules.common.security.domain.LoginUser;
import com.itssky.modules.common.security.manager.AsyncManager;
import com.itssky.modules.common.security.manager.factory.AsyncFactory;
import com.itssky.modules.common.security.utils.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 自定义退出处理类 返回成功
 * 
 * @author ITS
 */
@Configuration
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler
{
    @Autowired
    private TokenUtil tokenUtil;

    /**
     * 退出处理
     * 
     * @return
     */
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException
    {
        LoginUser loginUser = tokenUtil.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser))
        {
            String userName = loginUser.getUsername();
            // 删除用户缓存记录
            tokenUtil.delLoginUser(loginUser.getToken());
            // 记录用户退出日志
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(userName, Constants.LOGOUT, "退出成功"));
        }
        ServletUtils.renderString(response, JSON.toJSONString(AjaxResult.error(HttpStatus.SUCCESS, "退出成功")));
    }
}
