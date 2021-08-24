package com.example.domain;

import lombok.Data;

@Data
public class MemberVO {
    private String id;
    private String passwd;
    private String name;
    private String birthday;
    private String gender;
    private String email;
    private String recvEmail;
    private String regDate;
}
