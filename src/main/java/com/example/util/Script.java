package com.example.util;

public class Script {

    public static String href(String message, String path){
        StringBuilder sb = new StringBuilder();

        sb.append("<script>");
        sb.append("alert('" + message + "');");
        sb.append("locaion.href = '" + path + "';");
        sb.append("/<script>");
        return sb.toString();
    }

    public static String back(String message){
        StringBuilder sb = new StringBuilder();

        sb.append("<script>");
        sb.append("alert('" + message + "');");
        sb.append("history.back();");
        sb.append("/<script>");
        return sb.toString();
    }
}
