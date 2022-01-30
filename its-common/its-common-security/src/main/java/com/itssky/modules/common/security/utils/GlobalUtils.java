package com.itssky.modules.common.security.utils;

import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.utils.spring.SpringUtils;
import com.itssky.modules.common.security.domain.SysFile;
import com.itssky.modules.common.security.mapper.SysFileMapper;

import java.io.File;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 工具类
 * 
 * @author ITS
 */
public class GlobalUtils
{

    /**
     * 保存附件
     *
     * @param fileList
     * @return 结果
     */
    public static void saveFiles(Long searchId, Map<String,Object> fileList,Map<String,Object> delFiles)
    {
        SysFileMapper sysFileMapper = SpringUtils.getBean("sysFileMapper");

        /** 删除附件 */
        if(delFiles != null) {
            for(Map.Entry<String, Object> entry : delFiles.entrySet()){
                LinkedHashMap<String,Object> lkMapValue = (LinkedHashMap<String, Object>) entry.getValue();
                // 文件ID
                Integer fileid = (Integer) lkMapValue.get("fileid");
                if(fileid != null) {
                    sysFileMapper.deleteLogicSysFileById(Long.valueOf(fileid));
                }
            }
        }

        /** 新增&修改附件 */
        if(fileList != null) {
            for(Map.Entry<String, Object> entry : fileList.entrySet()){
                String mapKey = entry.getKey();
                LinkedHashMap<String,Object> lkMapValue = (LinkedHashMap<String, Object>) entry.getValue();
                // 文件名称
                String name = (String) lkMapValue.get("name");
                // 文件地址
                String url = (String) lkMapValue.get("url");
                // 文件字节
                Integer size = (Integer) lkMapValue.get("size");
                Date nowDate = DateUtils.getNowDate();
                SysFile sysFile = new SysFile();
                sysFile.setSearchId(searchId);
                String filepath = url.substring(url.indexOf("/profile"),url.length());
                sysFile.setFileName(getFileName(filepath));
                sysFile.setFileOriginName(name);
                sysFile.setFilePath(filepath);
                sysFile.setFileSize(size);
                sysFile.setCreateBy(SecurityUtils.getUsername());
                sysFile.setUpdateBy(SecurityUtils.getUsername());
                sysFile.setCreateTime(nowDate);
                sysFile.setUpdateTime(nowDate);
                sysFileMapper.insertSysFile(sysFile);
            }
        }
    }

    /**
     * 删除文件
     *
     * @param delFiles 文件数组
     * @return 结果
     */
    public static void delFiles(Long[] delFiles)
    {
        SysFileMapper sysFileMapper = SpringUtils.getBean("sysFileMapper");
        sysFileMapper.deleteLogicSysFileByIds(delFiles);
    }

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


    /**
     * 获取文件名
     * @param filePath 文件路径
     * @return 结果
     */
    public static String getClassName(Class<?> c) {
        return c.getName();
    }



}
