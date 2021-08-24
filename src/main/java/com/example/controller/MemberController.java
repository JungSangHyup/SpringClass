package com.example.controller;

import com.example.domain.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @GetMapping("/join")
    public String join(){
        System.out.println("조인");
        return "member/join";
    }

    @PostMapping("/join")
    public void join(MemberVO memberVO){
        System.out.println(memberVO);
    }
}
