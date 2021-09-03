package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.domain.AttachVO;
import com.example.mapper.AttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.mapper.BoardMapper;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Autowired
    private AttachMapper attachMapper;


    public int register(BoardVO boardVO) {
        return boardMapper.insert(boardVO);
    }

    @Transactional
    public void registerBoardAndAttaches(BoardVO boardVO, List<AttachVO> attachList) {
        boardMapper.insert(boardVO);
        attachMapper.insertAttaches(attachList);
    }

    public int nextNum() {
        return boardMapper.nextNum();
    }

    public int deleteAll() {
        return boardMapper.deleteAll();
    }

    @Transactional
    public void deleteBoardAndAttaches(int num){
        attachMapper.deleteAttachesByBno(num);
        boardMapper.deleteBoardByNum(num);
    }

    public List<BoardVO> getBoards() {
        return boardMapper.getBoards();
    }

    public Map<String, Object> getBoardAndAttaches(int num)
    {
        BoardVO boardVO = boardMapper.getBoard(num);
        List<AttachVO> attachList = attachMapper.getAttachesByBno(num);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardVO", boardVO);
        map.put("attachList", attachList);
        return map;
    }

    // 페이징으로 글 가져오기
    public List<BoardVO> getBoards(Criteria cri) {
        // 시작 행번호 (MySQL의 LIMIT절의 시작행번호) 구하기

        // 한 페이지당 글개수(amount)가 10개씩일때
        // 1 페이지 -> 0
        // 2 페이지 -> 10
        // 3 페이지 -> 20
        // 4 페이지 -> 30
        // ...
        int startRow = (cri.getPageNum() - 1) * cri.getAmount();
        cri.setStartRow(startRow); // 시작행번호 설정

        return boardMapper.getBoardsWithPaging(cri);
    }

    public int getTotalCount() {
        return boardMapper.getTotalCount();
    }

    public int getTotalCountBySearch(Criteria cri) {
        return boardMapper.getTotalCountBySearch(cri);
    }

    public BoardVO getBoard(int num) {
        return boardMapper.getBoard(num);
    }

    public void updateReadcount(int num) {
        boardMapper.updateReadcount(num);
    }

    @Transactional
    public void updateBoardAndInsterAttachesAndDeleteAttaches(BoardVO boardVO, List<AttachVO> newAttachList, List<String> delUuidList){
        attachMapper.insertAttaches(newAttachList);
        attachMapper.deleteAttachesByUuids(delUuidList);
        boardMapper.updateBoard(boardVO);
    }
}







