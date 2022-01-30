package com.itssky.modules.common.security.domain;


import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.web.domain.BaseEntity;
import com.itssky.modules.common.security.utils.SecurityUtils;

/**
 * 数据Entity类
 * @author ITS
 */
public abstract class DataEntity extends BaseEntity {

	private static final long serialVersionUID = 1L;
	

	public DataEntity() {
		super();
	}
	

	/**
	 * 插入之前执行方法，需要手动调用
	 */
	public void preInsert(){
		SysUser user = SecurityUtils.getLoginUser().getUser();
		this.setCreateBy(user.getUserName());
		this.setCreateTime(DateUtils.getNowDate());
	}
	
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	public void preUpdate(){
		SysUser user = SecurityUtils.getLoginUser().getUser();
		this.setUpdateBy(user.getUserName());
		this.setUpdateTime(DateUtils.getNowDate());
	}


}
