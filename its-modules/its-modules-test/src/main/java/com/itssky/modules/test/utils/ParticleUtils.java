package com.itssky.modules.demo.utils;

import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.utils.spring.SpringUtils;
import com.itssky.modules.common.security.domain.SysFile;
import com.itssky.modules.common.security.mapper.SysFileMapper;
import com.itssky.modules.common.security.utils.SecurityUtils;

import java.io.File;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 工具类
 * 
 * @author ITS
 */
public class ParticleUtils
{

    /**
     * 获取文件名
     * @param filePath 文件路径
     * @return 结果
     */
    public static String getFileName(String filePath) {
        File tempFile =new File( filePath.trim());
        String fileName = tempFile.getName();
        return fileName;
    }



}
