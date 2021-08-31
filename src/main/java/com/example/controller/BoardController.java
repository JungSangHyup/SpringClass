package com.example.controller;

import java.util.Date;
import java.util.List;

import com.example.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageDTO;
import com.example.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    @Autowired
    private BoardService boardService;


    @GetMapping("/list")
    public String list(Criteria cri, Model model) {
        System.out.println("list 호출...");

        List<BoardVO> boardList = boardService.getBoards(cri);

        int totalCount = boardService.getTotalCount(); // 전체 글개수

        PageDTO pageDTO = new PageDTO(totalCount, cri); // 페이지블록(Pagination) 화면 만들때 필요한 정보

        // 뷰에서 사용할 데이터를 Model 객체에 저장 -> requestScope로 옮겨줌
        model.addAttribute("boardList", boardList);
        model.addAttribute("pageMaker", pageDTO);

        return "board/boardList";
    }

    @GetMapping("/content")
    public String content(int num, @ModelAttribute("pageNum") String pageNum, Model model){
        // 조회수 1 증가시키기
        boardService.updateReadcount(num);

        // 글 한 개 가져오기
        BoardVO boardVO = boardService.getBoard(num);

        model.addAttribute("board", boardVO);

        return "board/boardContent";// JSP 이름
    }

    @GetMapping("write")
    public String write(@ModelAttribute("pageNum") String pageNum){
        return "board/boardWrite";
    }

    @PostMapping("write")
    public String write(String id, String subject, String content){
        BoardVO boardVO = new BoardVO();

        int num = boardService.nextNum();
        boardVO.setNum(num);
        boardVO.setMid(id);
        boardVO.setSubject(subject);
        boardVO.setContent(content);
        boardVO.setReadcount(0);//조회수 0~199 임의의 값
        boardVO.setRegDate(new Date());
        boardVO.setIpaddr("127.0.0.1");//그냥 아이피 주소 설정
        boardVO.setReRef(num);
        boardVO.setReLev(0);
        boardVO.setReSeq(0);

        boardService.register(boardVO);
        return "board/boardList";
    }
}
