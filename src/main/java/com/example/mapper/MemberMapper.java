package com.example.mapper;

import org.apache.ibatis.annotations.Insert;
import com.example.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {
    @Insert("INSERT INTO member(id, passwd, name, birthday, gender, email, recv_email, reg_date)"
            + "VALUES(#{id}, #{passwd}, #{name}, #{birthday}, #{gender}, #{email}, #{recvEmail}, #{regDate})")
    void insert(MemberVO memberVo);
}
