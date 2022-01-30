package com.itssky.modules.particle.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 属性提取工具类
 * @author its
 */
public class AttributesExtractUtils {

    /**
     * 从集合中提取信息
     * <p>
     * 适用于：list<对象>
     *
     * @param targets
     * @param targetFields
     * @return
     */
    public static List<Map<String, Object>> extractForCollection(Collection<?> targets, String... targetFields) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (Object target : targets) {
            result.add(extract(target, targetFields));
        }
        return result;
    }

    /**
     * 从普通POJO类中提取关键信息, 要求遵循 getMethod 规范
     *
     * @param target       目标JAVA POJO类,要求装有数据
     * @param targetFields 类的属性名字: 希望从 POJO 中提取哪些字段的数据
     * @return 数据会被装载于MAP中
     */
    @SuppressWarnings({"AliEqualsAvoidNull", "AlibabaCollectionInitShouldAssignCapacity"})
    public static Map<String, Object> extract(Object target, String... targetFields) {
        if ((null == target) || null == targetFields || 0 == targetFields.length) {
            return new HashMap<>();
        }
        Map<String, Object> objectMap = new HashMap<>();
        for (String targetField : targetFields) {
            Class<?> targetClass = target.getClass();
            try {
                Field field = targetClass.getDeclaredField(targetField);
                String methodNamePrefix = field.getType().getName().equals("boolean") ? "is" : "get";
                String methodName = methodNamePrefix + String.valueOf(targetField.charAt(0)).toUpperCase()
                        + targetField.substring(1);
                Method targetMethod = targetClass.getMethod(methodName);
                Object invoke = targetMethod.invoke(target);
                objectMap.put(getNameOfElegant(targetField), invoke);
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return objectMap;
    }

    private static String getNameOfElegant(String old) {
        StringBuilder stringBuilder = new StringBuilder();
        for (char c : old.toCharArray()) {
            if (Character.isUpperCase(c) && stringBuilder.length() > 0) {
                stringBuilder.append("_");
            }
            stringBuilder.append(c);
        }
        return stringBuilder.toString().toLowerCase();
    }

    @SuppressWarnings("AliEqualsAvoidNull")
    public static <T> T map2Object(Map<String, Object> map, Class<T> clazz) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if (map == null) {
            return null;
        }
        T obj = null;
        try {
            // 使用newInstance来创建对象
            obj = clazz.newInstance();
            // 获取类中的所有字段
            Field[] fields = obj.getClass().getDeclaredFields();
            for (Field field : fields) {
                int mod = field.getModifiers();
                // 判断是拥有某个修饰符
                if (Modifier.isStatic(mod) || Modifier.isFinal(mod)) {
                    continue;
                }
                // 当字段使用private修饰时，需要加上
                field.setAccessible(true);
                // 获取参数类型名字
                String filedTypeName = field.getType().getName();
                // 判断是否为时间类型，使用equalsIgnoreCase比较字符串，不区分大小写
                // 给obj的属性赋值
                if (filedTypeName.equalsIgnoreCase("java.util.date")) {
                    String datetimestamp = (String) map.get(field.getName());
                    if (datetimestamp.equalsIgnoreCase("null")) {
                        field.set(obj, null);
                    } else {
                        field.set(obj, sdf.parse(datetimestamp));
                    }
                } else {
                    field.set(obj, map.get(field.getName()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }

}