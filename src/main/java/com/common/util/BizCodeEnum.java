package com.common.util;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by heyutao on 14-6-4.
 */
public enum BizCodeEnum {

    SUCCESS(200),//成功

    SERVER_ERR (500000),//服务器错误
    API_ERROR (500001) ,//API错误
    PARAM_ERROR (500002),//参数错误
    DB_ERROR (500003),//数据库错误
    SMS_ERROR (500004);//发送短信错误

    /**
     * biz
     */
    public final int code;

    BizCodeEnum(int value) {
        this.code = value;
    }

    public static BizCodeEnum get(int value) {
        for (BizCodeEnum e : BizCodeEnum.values()) {
            if (e.code == value) {
                return e;
            }
        }
        return null;
    }



    private static Map<Integer, String> map = new HashMap<Integer, String>();

    static {
        map.put(SUCCESS.code, "成功");

        map.put(SERVER_ERR.code, "服务器错误");
        map.put(API_ERROR.code, "API错误");
        map.put(PARAM_ERROR.code, "参数错误");
        map.put(DB_ERROR.code, "数据库错误");
        map.put(SMS_ERROR.code, "发送短信失败");

        /**
         * biz
         */

    }


    public static String getMsg(int code) {
        String msg = map.get(code);
        if (msg != null) {
            return msg;
        }
        return "服务器错误";
    }
}

