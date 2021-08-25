package com.example.mapper;

import org.apache.ibatis.annotations.Insert;
import com.example.domain.MemberVO;

public interface MemberMapper {
    @Insert("INSERT INTO member(id, passwd, name, birthday, gender, email, recv_email, reg_data)"
            + "VALUES(#{id}, #{passwd}, #{name}, #{birthday}, #{gender}, #{email}, #{recv_email}, #{regDate})")

    void insert(MemberVO memberVo);
}
