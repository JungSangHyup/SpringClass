package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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




}
