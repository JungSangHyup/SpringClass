package com.example.mapper;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {


    int insert(BoardVO boardVO); // 글 한개 등록하기

    int nextNum(); // 다음 insert할 글번호 가져오기

    int deleteAll(); // 전체 행 삭제

    List<BoardVO> getBoards();  // 전체 게시글 내용 가져오기

    List<BoardVO> getBoardsWithPaging(Criteria cri);  // 페이징으로 게시글 내용 가져오기

    int getTotalCount();  // 전체 글개수 가져오기

    int getTotalCountBySearch(Criteria cri);  // 검색을 적용하여 전체 글개수 가져오기


    BoardVO getBoard(int num); // 글번호에 해당하는 글 한개 가져오기


    void updateReadcount(int num); // 글번호에 해당하는 글의 조회수를 1 증가시키기

}







