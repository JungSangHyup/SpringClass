package com.example.controller;

import com.example.domain.MemberVO;
import com.example.mapper.MemberMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;


@Controller
@ComponentScan
@RequestMapping("/member/*")

@Configuration
@MapperScan("com.example.mapper")
public class MemberController {
    private MemberMapper memberMapper;

    @GetMapping("/join")
    public String join(){
        System.out.println("조인");
        return "member/join";
    }

    @PostMapping("/join")
    public String join(MemberVO memberVO){
        String birthday = memberVO.getBirthday();
        birthday = birthday.replace("-", "");
        memberVO.setBirthday(birthday);
        memberVO.setRegDate(String.valueOf(new Date()));
        memberMapper.insert(memberVO);
        System.out.println(memberVO);
        return "member/login";
    }
}
