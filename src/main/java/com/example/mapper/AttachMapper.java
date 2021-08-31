package com.example.mapper;

import com.example.domain.AttachVO;

import java.util.List;

public interface AttachMapper {
    int insertAttach(AttachVO attachVO);
    int insertAttaches(List<AttachVO> attachList);
}
