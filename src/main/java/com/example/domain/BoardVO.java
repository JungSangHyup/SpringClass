package com.example.domain;

import lombok.Data;
import java.util.Date;

@Data
public class BoardVO {
    private int num;
    private String mid;
    private String subject;
    private String content;
    private int readcount;
    private Date regDate;
    private String ipaddr;
    private int reRef;
    private int reLev;
    private int reSeq;
}
