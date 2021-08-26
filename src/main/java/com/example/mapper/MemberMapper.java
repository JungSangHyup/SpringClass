package com.example.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.example.domain.MemberVO;
import java.util.List;


public interface MemberMapper {
    @Insert("INSERT INTO member(id, passwd, name, birthday, gender, email, recv_email, reg_date)"
            + "VALUES(#{id}, #{passwd}, #{name}, #{birthday}, #{gender}, #{email}, #{recvEmail}, #{regDate})")
    int insert(MemberVO memberVo);

    @Select("SELECT * FROM member WHERE id = #{id}")
    MemberVO getMemberById(String id);

    @Select("SELECT * FROM member ORDER BY id")
    List<MemberVO> getMembers();

    @Select("SELECT COUNT(*) FROM member WHERE id = #{id}")
    int getCountById(String id);

    @Delete("DELETE FROM member WHERE id = #{id}")
    int deleteMemberById(String id);

    @Update("UPDATE member " +
            "SET passwd = #{passwd}, name = #{name}, birthday = #{birthday}, gender = #{gender}, email = #{email}, recv_email = #{recvEmail}, reg_date = #{regDate}" +
            "WHERE id = #{id}")
    void updateMember(MemberVO memberVO);
}