package com.example.service;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;



@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public int register(BoardVO boardVO){
        return boardMapper.insert(boardVO);
    }

    public int nextNum(){
        return boardMapper.nextNum();
    }

    public int deleteAll(){
        return boardMapper.deleteAll();
    }

    public List<BoardVO> getBoards(){
        return boardMapper.getBoards();
    }

    public List<BoardVO> getBoards(Criteria cri){
        int startRow = (cri.getPageNum() - 1) * cri.getAmount();
        cri.setStartRow(startRow);
        return boardMapper.getBoardsWithPaging(cri);
    }

    public int getTotalCount(){
        return boardMapper.getTotalCount();
    }
}
