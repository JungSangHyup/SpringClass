package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // @Component 계열 애노테이션
@RequestMapping("/ajax/*")

public class AjaxController {

    @GetMapping("/member")
    public String select(){
        return "ajax/selectOneMember";
    }


    @GetMapping("/members")
    public String selectAll(){
        return "ajax/selectAllMembers";
    }

    @GetMapping("/insertmember")
    public String insertmember(){
        return "ajax/insertMember";
    }

    @GetMapping("/insertboard")
    public String insert(){
        return "ajax/insertBoard";
    }

    @GetMapping("/deletemember")
    public String delete(){
        return "ajax/deleteMember";
    }
}
