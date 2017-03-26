package com.common.util;

/**
 * Created by zhaojunjun on 15/12/19.
 */
public class ResponseResult {

    public static final int STATUS_OK = 200;

    String message;
    int code;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
