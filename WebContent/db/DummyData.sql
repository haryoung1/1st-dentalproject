------------------------------------------------------
--            회원정보 MEMBER                     
------------------------------------------------------
-- DUMMY DATA
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('kim', '123', '킴민지', 'kim@naver.com', '민지.jpg', '2004-05-07', '강원도 춘천시');  
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('pham', '123', '팜하니', 'hani@naver.com', '하니.jpg', '2004-10-06', '멜버른');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('dan', '123', '모지혜', 'dani@naver.com', '다니엘.jpg', '2005-04-11', '뉴캐슬'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('kang', '123', '강해린', 'kang@naver.com', '해린.jpg', '2006-05-15', '서울시 강남구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('lee', '123', '이혜인', 'lee@naver.com', '해인.jpg', '2008-04-21', '인천광역시 문학동'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('bin', '123', '강성빈', 'bin@naver.com', '정국.jpg', '1994-08-25', '서울특별시 강서구'); 

SELECT * FROM MEMBER;
COMMIT;
------------------------------------------------------
--            관리자 ADMIN                     
------------------------------------------------------

-- DUMMY DATA
INSERT INTO ADMIN (aID, aPW, aNAME, aCODE)
    VALUES ('admin', '111', '관리자', '143');

SELECT * FROM ADMIN;
COMMIT;
------------------------------------------------------
--            공지사항 게시판 NoticeBoard                 
------------------------------------------------------
-- DUMMY DATA
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지사항', '공지내용', '192.168.0.1');
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin1', '공지사항1', '공지내용1', '192.168.0.1');    
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin1', '공지사항2', '공지내용2', '192.168.0.1');    

SELECT * FROM NOTICEBOARD;
COMMIT;
------------------------------------------------------
-- 진료예약 게시판 MedicalReservationBoard                     
------------------------------------------------------
-- DUMMY DATA (원글과 답변)
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'kim', null, '킴민지 예약글', '예약내용1', MRBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'pham', null, '사랑니 발치', '예약내용2', MRBOARD_SEQ.CURRVAL, 0, 0, '192.1.1');
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'kang', null, '진료예약 합니다.', '예약내용3', MRBOARD_SEQ.CURRVAL, 0, 0, '198.1.1');

-- 답변글
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, null, 'admin', '[답]답글이용', '예약해드림', 1, 1, 1, '210.2.2');

INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'ccc', null, '진료예약 합니다', '예약내용3', MRBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');


SELECT * FROM MRBOARD;
COMMIT;
------------------------------------------------------
--            상담 게시판 ConsultingBoard                     
------------------------------------------------------

-- DUMMY DATA (원글과 답변)
INSERT INTO CBBOARD (CBNO, mID, aID, CBTITLE, CBCONTENT, CBFILENAME, CBGROUP, CBSTEP, CBINDENT, CBIP)
    VALUES (CBBOARD_SEQ.NEXTVAL, 'aaa', null, '상담글1', '상담내용1', 'NOIMG.JPG', CBBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');
INSERT INTO CBBOARD (CBNO, mID, aID, CBTITLE, CBCONTENT, CBFILENAME, CBGROUP, CBSTEP, CBINDENT, CBIP)
    VALUES (CBBOARD_SEQ.NEXTVAL, 'bbb', null, '상담글2', '상담내용2', 'NOIMG.JPG', CBBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');  
INSERT INTO CBBOARD (CBNO, mID, aID, CBTITLE, CBCONTENT, CBFILENAME, CBGROUP, CBSTEP, CBINDENT, CBIP)
    VALUES (CBBOARD_SEQ.NEXTVAL, 'ccc', null, '상담글3', '상담내용3', 'NOIMG.JPG', CBBOARD_SEQ.CURRVAL, 0, 0, '222.2.3');  


-- 위 2번글에 대한 답변글
INSERT INTO CBBOARD (CBNO, mID, aID, CBTITLE, CBCONTENT, CBFILENAME, CBGROUP, CBSTEP, CBINDENT, CBIP)
    VALUES (CBBOARD_SEQ.NEXTVAL, null, 'admin', '[답]하이', '답본문', 'NOIMG.JPG', 2, 1, 1, '210.2.2');

SELECT * FROM CBBOARD;
COMMIT;
------------------------------------------------------
--            후기 게시판 ReviewBoard                     
------------------------------------------------------
-- DUMMY DATA (원글)
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'aaa', null, '후기글1', '친절해요', null, '192.168.10.151');
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'bbb', null, '후기글2', '친절해요', null, '192.168.10.151');
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'ccc', null, '후기글3', '친절해요', null, '192.168.10.151');

SELECT * FROM RVBOARD;
COMMIT;