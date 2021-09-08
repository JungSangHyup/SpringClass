package com.example.service;

import com.example.domain.MemberVO;
import com.example.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
//@Transactional
public class MemberService {
    // 생성자에서는 Autowired 생략 가능
    private MemberMapper memberMapper;

    @Autowired
    public MemberService(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    // 회원 가입
    public int register(MemberVO memberVO)
    {
        return memberMapper.insert(memberVO);
    }

    public MemberVO getMemberById(String id){
        return memberMapper.getMemberById(id);
    }

    public List<MemberVO> getMembers(){
        return memberMapper.getMembers();
    }

    public int getCountById(String id){
        return memberMapper.getCountById(id);
    }

    public int deleteMemberById(String id){
        return memberMapper.deleteMemberById(id);
    }

    public void updateMember(MemberVO memberVO){
        memberMapper.updateMember(memberVO);
    }
}