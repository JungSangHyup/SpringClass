package com.example.service;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.MemberVO;
import com.example.mapper.MemberMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
//@Transactional
public class MemberService {
    // 생성자에서는 Autowired 생략 가능
    private MemberMapper memberMapper;
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