package com.example.mapper;

import com.example.domain.BoardVO;

public interface BoardMapper {
    int insert(BoardVO boardVO); // 글 한 개 등록하기

    int nextNum(); //다음 글번호 가져오기

    int deleteAll();
}
