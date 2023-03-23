-- DAO에 들어갈 쿼리

------------------------------------------------------
--           MEMBER Dao query            
------------------------------------------------------
-- (1) 회원 ID 중복체크
SELECT * FROM MEMBER WHERE MID='aaa';

-- (2) 회원 이메일 중복체크
SELECT * FROM MEMBER WHERE mEMAIL = 'Kang@NN.COM';

-- (3) 회원가입
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('han', '123', '한지민', 'han@H.COM', 'han.JPG', '1982-11-05', '서울시');
    
-- (4) 로그인
SELECT * FROM MEMBER WHERE mID='aaa' AND mPW='123';

-- (5) mID로 DTO 가져오기 (로그인 성공시 session에 넣기위한 용도)
SELECT * FROM MEMBER WHERE mID='aaa';

-- (6) 회원정보 수정
UPDATE MEMBER SET mPW = '123',
        mNAME = '수정용',
        mEMAIL = 'su@ss@.com',
        mPHOTO = 'kim.JPG',
        mBIRTH = '1984-10-12',
        mADDRESS = '서울시'
    WHERE mID = 'bbb';

-- (7) 회원리스트 (TOP-N구문)
SELECT * FROM (SELECT ROWNUM RN, A.*
    FROM (SELECT * FROM MEMBER ORDER BY mRDATE DESC) A)
WHERE RN BETWEEN 1 AND 4;

-- (8) 회원탈퇴전 글 삭제하기
DELETE FROM MRBOARD WHERE MID = 'aaa'; 
DELETE FROM CBBOARD WHERE MID = 'aaa'; 
DELETE FROM RVBOARD WHERE MID = 'aaa'; 

-- (9) 회원탈퇴
DELETE FROM MEMBER WHERE mID = 'han';

SELECT * FROM MEMBER;
COMMIT;

-- (10) 전체회원 목록
SELECT COUNT(*) FROM MEMBER;
------------------------------------------------------
--          Admin Dao query                   
------------------------------------------------------
-- (1) 관리자 등록
INSERT INTO ADMIN (AID, APW, ANAME, ACODE)
    VALUES ('admin3', '123', '관리킴', '111');

-- (2) 관리자 로그인
SELECT * FROM ADMIN WHERE aID='admin3' AND aPW='123';

-- (3) 로그인 후 세션에 넣을 용도 (admin aID로 dto 가져오기)
SELECT * FROM ADMIN WHERE aID='admin';

-- (4) 관리자 탈퇴
DELETE FROM ADMIN WHERE AID = 'admin3';

SELECT * FROM ADMIN;
COMMIT;

------------------------------------------------------
--          Notice Dao query                   
------------------------------------------------------

-- (1) 글 목록 (startRow ~ endRow까지)
SELECT * 
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT N.*, ANAME FROM NOTICEBOARD N, ADMIN A  WHERE N.AID = A.AID
        ORDER BY NBNO DESC) A)
    WHERE RN BETWEEN 1 AND 10;

-- (2) 전체 글 갯수
SELECT COUNT(*) FROM NOTICEBOARD;

-- (3) 공지사항 등록 (원글)
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지사항5', '오늘밥뭐냐', '192.168.0.1');

-- (4) NBNO(글번호)로 DTO 가져오기 (상세보기, 수정VIEW)
SELECT N.*, ANAME FROM NOTICEBOARD N, ADMIN A WHERE N.AID=A.AID AND NBNO=28;

-- (5) 공지사항 수정
UPDATE NOTICEBOARD SET 
        NBTITLE ='공지제목 수정정',
        NBCONTENT ='휴진할래',
        NBRDATE = SYSDATE,
        NBIP = '125.0'
    WHERE NBNO = 28;

-- (6) 공지사항 삭제
DELETE FROM NOTICEBOARD WHERE NBNO = 24;

SELECT * FROM NOTICEBOARD ORDER BY NBNO DESC;
COMMIT;

------------------------------------------------------
-- MedicalReservationBoard (진료예약게시판 MRBOARD) Dao query                   
------------------------------------------------------

-- (1) 글 목록 (startRow ~ endRow까지)
SELECT A. *,
    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,
    (SELECT ANAME FROM ADMIN WHERE A.AID=AID) ANAME
        FROM (SELECT ROWNUM RN, B.*
            FROM (SELECT * FROM MRBOARD ORDER BY MRRDATE DESC) B) A
    WHERE RN BETWEEN 1 AND 5;

-- (2) 글 갯수
SELECT COUNT(*) FROM MRBOARD;
        
-- (3) 글쓰기 원글
INSERT INTO MRBOARD (MRNO, MID, AID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'aaa', null, '예약글5', '예약내용5', MRBOARD_SEQ.CURRVAL, 0, 0, '192.168.1');

-- (4) hit(조회수) 1회 올리기
UPDATE MRBOARD SET MRHIT = MRHIT + 1 WHERE MRNO = 1;

-- (5) 글번호(MRNO)로 글 전체 내용(MRboardDto) 가져오기
SELECT * FROM MRBOARD WHERE MRNO = 1;

-- (6) 글 수정하기(MRNO, MRtitle, MRcontent, MRrdate(SYSDATE), MRip 수정)
UPDATE MRBOARD SET
        MRTITLE = '바뀐제목',
        MRCONTENT ='바뀐본문',
        MRRDATE = SYSDATE,
        MRIP = '192.168.2'
    WHERE MRNO = 1;

-- (7) 글 삭제하기 (MRNO로)
DELETE FROM MRBOARD WHERE MRNO = 1;

-- (8) 답변글 쓰기 전 단계 (원글의 MRgroup과 같고, 원글의 MRstep 보다 크면 MRstep을 하나 증가)
UPDATE MRBOARD
    SET MRSTEP = MRSTEP + 1
    WHERE MRGROUP = 2 AND MRSTEP > 0;
    
-- (9) 답변글 쓰기
SELECT * FROM MRBOARD WHERE MRNO = 2;
INSERT INTO MRBOARD (MRNO, MID, AID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, null, 'admin', '답변', '답글이다', 2, 1, 1, '192.268.10.');

-- (10) 회원탈퇴시 탈퇴하는 회원 (mID)이 쓴 글 모두 삭제하기
DELETE FROM MRBOARD WHERE mID = 'aaa';

SELECT * FROM MRBOARD;
COMMIT;

------------------------------------------------------
--  ConsultingBoard (상담게시판 CBOARD) Dao query                   
------------------------------------------------------

-- (1) 글 목록 (startRow ~ endRow까지)
SELECT A. *,
    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,
    (SELECT ANAME FROM ADMIN WHERE A.AID=AID) ANAME
        FROM (SELECT ROWNUM RN, B.*
            FROM (SELECT * FROM CBBOARD ORDER BY CBRDATE DESC) B) A
    WHERE RN BETWEEN 1 AND 10;

-- (2) 글 갯수
SELECT COUNT(*) FROM CBBOARD;

-- (3) 글쓰기 원글
INSERT INTO CBBOARD (CBNO, MID, AID, CBTITLE, CBCONTENT, CBFILENAME, CBGROUP, CBSTEP, CBINDENT, CBIP)
    VALUES (CBBOARD_SEQ.NEXTVAL, 'ccc', null, '또상담', '상담본문', 'han.JPG' , CBBOARD_SEQ.CURRVAL, 0, 0, '192.168.1');

-- (4) hit(조회수) 1회 올리기
UPDATE CBBOARD SET CBHIT = CBHIT + 1 WHERE CBNO = 1;

-- (5) 글번호(CBNO)로 글 전체 내용(CboardDto) 가져오기
SELECT CB.*, MNAME FROM CBBOARD CB, MEMBER M WHERE CB.MID=M.MID AND CBNO=1;


-- (6) 글 수정하기(CBNO, CBtitle, CBcontent, CBFILENAME, CBrdate(SYSDATE), CBip 수정)
UPDATE CBBOARD SET
        CBTITLE = '바뀐제목',
        CBCONTENT ='바뀐본문',
        CBFILENAME ='NOIMG.JPG',
        CBRDATE = SYSDATE,
        CBIP = '192.168.2'
    WHERE CBNO = 1;

-- (7) 글 삭제하기(CBNO)
DELETE FROM CBBOARD WHERE CBNO = 8;

-- (8) 회원탈퇴시 탈퇴하는 회원 (mID)이 쓴 글 모두 삭제하기
DELETE FROM CBBOARD WHERE mID = 'CCC';

-- (9) 답변글 쓰기 전 단계 (원글의 CGROUP과 같고, 원글의 CSTEP 보다 크면 CSTEP을 하나 증가)
UPDATE CBBOARD
    SET CBSTEP = CBSTEP + 1
    WHERE CBGROUP = 2 AND CBSTEP > 0;

-- (10) 답변글 쓰기
SELECT * FROM CBBOARD WHERE CBNO = 2;
INSERT INTO CBBOARD (CBNO, MID, AID, CBTITLE, CBCONTENT, CBFILENAME, CBGROUP, CBSTEP, CBINDENT, CBIP)
    VALUES (CBBOARD_SEQ.NEXTVAL, null, 'admin', '답변글', '답본문', 'NOIMG.JPG', 2, 1, 1, '192.1.1.1');

SELECT * FROM CBBOARD;
COMMIT;

------------------------------------------------------
--  ReviewBoard (후기게시판 RVOARD) Dao query                   
------------------------------------------------------

SELECT A. *,
    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,
    (SELECT ANAME FROM ADMIN WHERE A.AID=AID) ANAME
        FROM (SELECT ROWNUM RN, B.*
            FROM (SELECT * FROM RVBOARD ORDER BY RVRDATE DESC) B) A
    WHERE RN BETWEEN 1 AND 10;

-- (2) 글 갯수
SELECT COUNT(*) FROM RVBOARD;

-- (3) 글쓰기 원글
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'ccc', null, '진료후기', '너무 친절해요', 'NOIMG.JPG', '192.168.0.1');

-- (4) hit(조회수) 1회 올리기
UPDATE RVBOARD SET RVHIT = RVHIT + 1 WHERE RVNO = 1;

-- (5) 글번호(RVNO)로 글 전체 내용(RboardDto) 가져오기
SELECT * FROM RVBOARD WHERE RVNO = 1;

-- (6) 글 수정하기(RVNO, RVtitle, RVcontent, RVFILENAME, RVrdate(SYSDATE), RVip 수정)
UPDATE RVBOARD SET
        RVTITLE = '바뀐제목',
        RVCONTENT ='바뀐본문',
        RVFILENAME ='son.JPG',
        RVRDATE = SYSDATE,
        RVIP = '192.168.2'
    WHERE RVNO = 1;

-- (7) 글 삭제하기(RVNO로)
DELETE FROM RVBOARD WHERE RVNO = 1;

-- (8) 회원탈퇴시 탈퇴하는 회원 (mID)이 쓴 글 모두 삭제하기
DELETE FROM RVBOARD WHERE mID = 'ccc';

SELECT * FROM RVBOARD;
COMMIT;



SELECT * FROM ADMIN;

DELETE * FROM ADMIN WHERE AID = 'aa';



SELECT * FROM MEMBER;