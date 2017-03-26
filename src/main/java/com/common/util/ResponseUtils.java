package com.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhaojunjun on 15/12/19.
 */
public class ResponseUtils {
    private final static Logger logger = LoggerFactory.getLogger(ResponseUtils.class);


    public static Map getResponse(Map<String,Object> data,int code,String message){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data",data);
        ResponseResult result = new ResponseResult();
        result.setCode(code);
        result.setMessage(message);
        map.put("result",result);
        return map;
    }

    public static Map getStringResponse(String data, int code, String message) {
        return geneResponse(data,code,message);
    }

    private static Map geneResponse(Object data, int code, String message) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("data",data);
        ResponseResult result = new ResponseResult();
        result.setCode(code);
        result.setMessage(message);
        map.put("result",result);
        return map;
    }


    public static Map getResponseError(int code,String message){
        Map<String,Object> data = new HashMap<String, Object>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("date",data);
        ResponseResult result = new ResponseResult();
        result.setCode(code);
        result.setMessage(message);
        map.put("result",result);
        return map;
    }

    public static Map getResponse(Map<String,Object> data){
        return getResponse(data,ResponseResult.STATUS_OK,"");
    }
}
