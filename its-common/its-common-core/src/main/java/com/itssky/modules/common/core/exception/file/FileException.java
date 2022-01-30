package com.itssky.modules.common.core.exception.file;


import com.itssky.modules.common.core.exception.BaseException;

/**
 * 文件信息异常类
 * 
 * @author ITS
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
