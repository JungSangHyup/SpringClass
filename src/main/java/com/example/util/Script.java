package com.example.util;

public class Script {
    private static final StringBuilder sb = new StringBuilder();
    public static String href(String message, String path){
        sb.setLength(0); // 비우기

        sb.append("<script>");
        sb.append("alert('" + message + "');");
        sb.append("locaion.href = '" + path + "';");
        sb.append("/<script>");
        return sb.toString();
    }

    public static String back(String message){
        sb.setLength(0); // 비우기

        sb.append("<script>");
        sb.append("alert('" + message + "');");
        sb.append("history.back();");
        sb.append("/<script>");
        return sb.toString();
    }
}
