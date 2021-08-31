package com.example.mapper;

import java.util.Date;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;

	@Test
	public void testInsert() {
		boardMapper.deleteAll();
		Random random = new Random();

		for(int i=1; i<=127; i++) {
			BoardVO boardVO = new BoardVO();
			int num = boardMapper.nextNum();
			boardVO.setNum(num);
			boardVO.setMid("awef22sd");
			boardVO.setSubject("글제목" + i + "입니다.");
			boardVO.setContent("글내용" + i + "입니다.\n글내용 테스트");
			boardVO.setReadcount(random.nextInt(200));//조회수 0~199 임의의 값
			boardVO.setRegDate(new Date());
			boardVO.setIpaddr("127.0.0.1");//그냥 아이피 주소 설정
			boardVO.setReRef(num);
			boardVO.setReLev(0);
			boardVO.setReSeq(0);

			boardMapper.insert(boardVO);
		}
	}

//	@Test
//	public void testSelect() {
//		boardMapper.deleteAll();
//		Random random = new Random();
//
//		System.out.println(boardMapper.getTotalCount());
//		System.out.println();
//
//		for(BoardVO board : boardMapper.getBoards()){
//			System.out.println(board);
//		}
//	}
}

