package com.example.service;

import com.example.domain.MemberVO;
import com.example.mapper.MemberMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
    private MemberMapper memberMapper;
    public MemberService(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }
    public void register(MemberVO memberVO){
        memberMapper.insert(memberVO);
    }
}