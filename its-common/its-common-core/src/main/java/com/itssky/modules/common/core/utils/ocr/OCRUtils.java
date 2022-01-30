package com.itssky.modules.common.core.utils.ocr;

import com.itssky.modules.common.core.utils.DateUtils;
import com.itssky.modules.common.core.utils.StringUtils;
import com.itssky.modules.common.core.utils.sign.Md5Utils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.imageio.stream.FileImageInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * ocr工具类
 */
public class OCRUtils {

    public static void main(String[] args) throws Exception {
        String dataPath = "D:/Excel文件/ocr测试/身份证.jpg";
        String data = getData(dataPath, "3");
        System.out.println(data);
    }

    private static final Logger log = LoggerFactory.getLogger(OCRUtils.class);
    private static final String IP = "10.207.255.23";
    private static final String PORT = "8890";
    private static final String URL = "/ocr/auto_recognise";
    private static final String DEV_KEY = "40ff7ebfb952b623149688eac84cc68b";
    private static final String APP_KEY = "4c5d548a";
    private static final String DRIVING_LICENSE = "1"; //驾驶证
    private static final String DRIVERS_LICENSE = "2"; //行驶证
    private static final String ID_CARD = "3"; //身份证
    private static final String BUSINESS_LICENSE = "4"; //营业执照

    public static String getData(String dataPath, String type) {
        String url = "http://" + IP + ":" + PORT + URL;
        log.info("请求数据路径:" + url);
        String requestTime = DateUtils.getTime();
        String senssionKey = Md5Utils.hash(requestTime + DEV_KEY);
        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("x-app-key", APP_KEY);
        headerMap.put("x-sdk-version", "8.0");
        headerMap.put("x-request-date", requestTime);
        if (StringUtils.isNotBlank(type)) {
            if (StringUtils.equals(DRIVING_LICENSE, type)) {
                //驾驶证
                headerMap.put("x-task-config", "capkey=ocr.cloud.template,property=zjg_sfzg");
            } else if (StringUtils.equals(DRIVERS_LICENSE, type)) {
                //行驶证
                headerMap.put("x-task-config", "capkey=ocr.cloud.template,property=zjg_sfsq");
            } else if (StringUtils.equals(ID_CARD, type)) {
                //身份证
                headerMap.put("x-task-config", "capkey=ocr.cloud.template,property=idcard");
            } else if (StringUtils.equals(BUSINESS_LICENSE, type)) {
                //营业执照
                headerMap.put("x-task-config", "capkey=ocr.cloud.template,property=bl");
            }
        }
        headerMap.put("x-udid", "101:1234567890");
        headerMap.put("x-session-key", senssionKey);
        headerMap.put("x-result-format", "json");
        long startTime = System.currentTimeMillis();
        String result = null;
        try {
            result = sendPost(url, headerMap, dataPath);
        } catch (Exception e) {
            log.info("获取ocr数据失败");
        }
        long endTime = System.currentTimeMillis();
        log.info("识别时间:" + (endTime - startTime) + "ms");
        return result;
    }

    /**
     * @param url      地址
     * @param headerMap  参数
     * @param dataPath 图片路径
     */
    public static String sendPost(String url, Map<String, String> headerMap, String dataPath) throws Exception {
        String result = null;
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);
        if (headerMap.size() > 0) {
            //循环增加header
            headerMap.forEach(post::addHeader);
        }
        if (StringUtils.isNotBlank(dataPath)) {
            byte[] data = image2byte(dataPath);
            ByteArrayEntity entity = new ByteArrayEntity(data) ;
            post.setEntity(entity);
        }
        CloseableHttpResponse response = httpClient.execute(post);
        if (response != null && response.getStatusLine().getStatusCode() == 200) {
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity);
        }
        return result;
    }

    /**
     * 图片转二进制
     * @param path
     * @return
     */
    public static byte[] image2byte(String path){
        byte[] data = null;
        FileImageInputStream input = null;
        try {
            input = new FileImageInputStream(new File(path));
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int numBytesRead = 0;
            while ((numBytesRead = input.read(buf)) != -1) {
                output.write(buf, 0, numBytesRead);
            }
            data = output.toByteArray();
            output.close();
            input.close();
        }
        catch (FileNotFoundException ex1) {
            ex1.printStackTrace();
        }
        catch (IOException ex1) {
            ex1.printStackTrace();
        }
        return data;
    }
}
