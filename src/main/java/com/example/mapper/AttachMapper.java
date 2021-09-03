package com.example.mapper;

import com.example.domain.AttachVO;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

public interface AttachMapper {
    int insertAttach(AttachVO attachVO);

    int insertAttaches(List<AttachVO> attachList);

    List<AttachVO> getAttachesByBno(int bno);

    List<AttachVO> getAttachesByUuids(List<String> uuidList);

    @Delete("DELETE FROM attach WHERE bno = #{bno}")
    int deleteAttachesByBno(int bno);

    int deleteAttachesByUuids(List<String> uuidList);


}
