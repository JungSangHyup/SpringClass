package com.example.controller;

import com.example.domain.MemberVO;
import com.example.service.MemberService;
import com.example.util.Script;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;


@Controller
@ComponentScan
@RequestMapping("/member/*")

public class MemberController {
    @Autowired
    private MemberService memberService;


    @GetMapping("/join")
    public String join(){
        System.out.println("조인");
        return "member/join";
    }

    @GetMapping("/login")
    public String login(){
        return "member/login";
    }

    @PostMapping("/join")
    public ResponseEntity join(MemberVO memberVO){
        // password encryption
        String passwd = memberVO.getPasswd();
        String hashedPw = BCrypt.hashpw(passwd, BCrypt.gensalt());
        memberVO.setPasswd(hashedPw);

        //birhday without '-'
        String birthday = memberVO.getBirthday();
        birthday = birthday.replace("-", "");
        memberVO.setBirthday(birthday);

        // current date
        memberVO.setRegDate(new Date());

        System.out.println(memberVO);
        memberService.register(memberVO);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "text/html;charset=UTF-8");

        String str = Script.href("회원가입 성공!", "/member/login");

        return new ResponseEntity<String>(str, headers, HttpStatus.OK);
    }
}
