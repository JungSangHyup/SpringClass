## 멤버 페이지

#### db

member

![멤버테이블](https://user-images.githubusercontent.com/51068026/132149047-890c55f4-5ca5-4fdc-a3e4-575d19c38235.PNG)

#### page

##### /member/login

![로그인](https://user-images.githubusercontent.com/51068026/132149102-80884f62-75b2-4748-a21a-2d671cbd7ecf.PNG)

##### /member/join

![회원가입](https://user-images.githubusercontent.com/51068026/132149106-e0dc5587-d0de-40f0-be8e-bb614441adb7.PNG)

### 비지니스 로직

1. #### 회원가입

   form 태그 -> Post Mapping -> MemberService 내 Join  실행
   
   ##### Membermapper
   
   ```
   @Insert("INSERT INTO member(id, passwd, name, birthday, gender, email, recv_email, reg_date)"
           + "VALUES(#{id}, #{passwd}, #{name}, #{birthday}, #{gender}, #{email}, #{recvEmail}, #{regDate})")
   int insert(MemberVO memberVo);
   ```
   
   ##### MemberController
   
   ```
   @PostMapping("/join")
   public ResponseEntity<String> join(MemberVO memberVO) {
   
       // 비밀번호 암호화 하기
       String passwd = memberVO.getPasswd();
       String hasedPw = BCrypt.hashpw(passwd, BCrypt.gensalt()); 
       // 암호화된 비밀번호 리턴받음
       memberVO.setPasswd(hasedPw); // 암호화된 비밀번호로 재설정
   
       // 연월일 구분문자("-") 제거하기
       String birthday = memberVO.getBirthday(); // "2021-08-25"
       birthday = birthday.replace("-", ""); // "20210825"
       memberVO.setBirthday(birthday);
   
       // 현재시점 날짜 객체 설정
       memberVO.setRegDate(new Date());
   
       System.out.println(memberVO);
       memberService.register(memberVO); // 회원등록 처리
   
       // 서버에서 데이터를 추가,수정,삭제 후 화면응답을 바로 줄때는
       // 새로고침 발생시 서버에 오류가 발생될수 있으므로
       // 리다이렉트를 통해 사용자가 봐야될 화면 주소로 요청하게 만든다.
       // "redirect:/member/login";
   
   
       HttpHeaders headers = new HttpHeaders();
       headers.add("Content-Type", "text/html; charset=UTF-8");
   
       String str = Script.href("회원가입 성공!", "/member/login");
   
       return new ResponseEntity<String>(str, headers, HttpStatus.OK);
   }
   ```
   
   ##### MemberService
   
   ```
   // 회원 가입
   public int register(MemberVO memberVO)
   {
       return memberMapper.insert(memberVO);
   }
   ```

