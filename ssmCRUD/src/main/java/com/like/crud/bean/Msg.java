package com.like.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回json数据
 * @author shkstart
 * @create 2021-11-15 16:34
 */
public class Msg {
    //返回的状态码
    private int code;
    //提示信息
    private String msg;
    //用户返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String, Object>();

    public static Msg sucess(){

        Msg result = new Msg();

        result.setCode(100);

        result.setMsg("成功处理！！");

        return result;
    }

    public static Msg fail(){

        Msg result = new Msg();

        result.setCode(200);

        result.setMsg("失败处理！！");

        return result;
    }

    public Msg add(String key,Object value){

        this.getExtend().put(key,value);
        return this;

    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
