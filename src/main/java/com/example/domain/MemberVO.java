package com.example.domain;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberVO {
    private String id;
    private String passwd;
    private String name;
    private String birthday;
    private String gender;
    private String email;
    private String recvEmail;
    private Date regDate;
}
