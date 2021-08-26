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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    @PostMapping("/login")
    public ResponseEntity<String> login(String id, String passwd, String rememberMe,
                                        HttpSession session, HttpServletResponse response){
        MemberVO memberVO = memberService.getMemberById(id);
        boolean isPasswdSame = false;
        String message = "";
        if (memberVO != null){
            isPasswdSame = BCrypt.checkpw(passwd, memberVO.getPasswd());
            if (!isPasswdSame){
                message = "비밀번호가 일치하지 않습니다.";

            }
        }else {
            message = "존재하지 않는 아이디입니다.";
        }
        // 로그인 실패 시
        if(memberVO == null || isPasswdSame == false){
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "text/html;charset=UTF-8");

            String str = Script.back(message);

            return new ResponseEntity<String>(str, headers, HttpStatus.OK);
        }
        // 로그인 성공 시
        session.setAttribute("id", id);

        if(rememberMe != null){
            Cookie cookie = new Cookie("id", id);
            cookie.setPath("/");
            cookie.setMaxAge(60 * 10);

            response.addCookie(cookie);
        }

        // 영역 객체
        // application : 웹프로그램 한 개당 유지됨
        // session : 사용자 한 명당 유지됨
        // request : 사용자 요청 한 개당 유지됨
        // pageContext : JSP 화면 한 개 처리할 동안 유지 됨
        // 영역객체 수명 주기 (el 언어에서 검색 순서)
        // application > session > request > pageContext

        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", "/");

        // 리다이렉트일 경우 HttpStatus.FOUND
        return new ResponseEntity<String>(headers, HttpStatus.FOUND);
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        session.invalidate();

        Cookie[] cookies = request.getCookies();

        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("id")){
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        return "redirect:/";
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
