package com.example.mapper;

import com.example.domain.AttachVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AttachMapper {
    int insertAttach(AttachVO attachVO);

    int insertAttaches(List<AttachVO> attachList);

    List<AttachVO> getAttachesByBno(int bno);

    List<AttachVO> getAttachesByUuids(List<String> uuidList);

    List<AttachVO> getAllImages(); // 이미지 전체 들고오기

    @Select("SELECT * FROM attach WHERE uploadpath = #{uploadpath}")
    List<AttachVO> getAttachesByUploadpath(String uploadpath);

    @Delete("DELETE FROM attach WHERE bno = #{bno}")
    int deleteAttachesByBno(int bno);

    int deleteAttachesByUuids(List<String> uuidList);


}
