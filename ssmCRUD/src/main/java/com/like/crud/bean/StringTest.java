package com.like.crud.bean;

/**
 * @author shkstart
 * @create 2021-11-19 22:15
 */
public class StringTest {
    public static void main(String[] args) {
        String str1 = new StringBuilder("ja").append("va").toString();
        System.out.println(str1);
        System.out.println(str1.intern());
        System.out.println(str1==str1.intern());
        String str2 = new StringBuilder("mei").append("tuan").toString();
        System.out.println(str2);
        System.out.println(str2.intern());
        System.out.println(str2==str2.intern());



    }
}
