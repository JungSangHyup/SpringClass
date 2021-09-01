package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

import com.example.domain.AttachVO;
import com.example.mapper.BoardMapper;
import net.coobird.thumbnailator.Thumbnailator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    private String getFolder(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String str = sdf.format(new Date());
        return str;
    }

    private boolean checkImageType(File file) throws IOException {
        boolean isImage = false;

        String contentType = Files.probeContentType(file.toPath());
        // 이미지면 image/ 로 시작됨

        isImage = contentType.startsWith("image");

        return isImage;
    }

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
        Map<String, Object> map = boardService.getBoardAndAttaches(num);
        BoardVO boardVO = (BoardVO) map.get("boardVO");
        List<AttachVO> attachList = (List<AttachVO>) map.get("attachList");

        model.addAttribute("board", boardVO);
        model.addAttribute("attachList", attachList);

        return "board/boardContent";// JSP 이름
    }

    @GetMapping("write")
    public String write(@ModelAttribute("pageNum") String pageNum){
        return "board/boardWrite";
    }

    @PostMapping("write")
    public String write(List<MultipartFile> files, BoardVO boardVO, HttpServletRequest request, RedirectAttributes rttr) throws IOException {

        if(files != null){
            System.out.println("업로드한 첨부파일 개수 : " + files.size());
        }

        String uploadFoledr = "C:/upload";
        File uploadPath = new File(uploadFoledr, getFolder());
        System.out.println("uploadPath : " + uploadPath.getPath());

        if(!uploadPath.exists()){
            uploadPath.mkdirs();
        }

        List<AttachVO> attachList = new ArrayList<>();

        int num = boardService.nextNum();

        for(MultipartFile file: files){
            // 파일이 비어있는지 검사
            if(!file.isEmpty()){
                String originalFilename = file.getOriginalFilename();
                UUID uuid = UUID.randomUUID();
                String uploadFilename = uuid.toString() + "_" + originalFilename;

                File uploadFile = new File(uploadPath, uploadFilename);
                file.transferTo(uploadFile);

                //현재 파일이 이미지 파일이면 썸네일 이미지 추가 생성
                boolean isImage = checkImageType(uploadFile);
                if(isImage){
                    File outFile = new File(uploadPath, "s_" + uploadFilename);
                    Thumbnailator.createThumbnail(uploadFile, outFile, 100, 100);
                }

                AttachVO attachVO =  new AttachVO();
                attachVO.setUuid(uuid.toString());
                attachVO.setUploadpath(getFolder());
                attachVO.setFilename(originalFilename);
                attachVO.setFiletype((isImage) ? "I" : "O");
                attachVO.setBno(num);

                attachList.add(attachVO);
            }
        }

        boardVO.setNum(num);
        boardVO.setReadcount(0);//조회수 0~199 임의의 값
        boardVO.setRegDate(new Date());
        boardVO.setIpaddr(request.getRemoteAddr());//그냥 아이피 주소 설정
        boardVO.setReRef(num);
        boardVO.setReLev(0);
        boardVO.setReSeq(0);

        if(files != null){
            boardService.registerBoardAndAttaches(boardVO, attachList);
        }else{
            boardService.register(boardVO);
        }


        // 리다이렉트시 서버에 전달할 쿼리 스트링
        rttr.addAttribute("num", boardVO.getNum());
        rttr.addAttribute("pageNum", 1);

        return "redirect:/board/content";
    }
}
