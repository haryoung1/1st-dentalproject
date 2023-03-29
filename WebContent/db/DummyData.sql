------------------------------------------------------
--            회원정보 MEMBER                     
------------------------------------------------------
-- DUMMY DATA
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('kim', '123', '킴민지', 'kim@naver.com', '민지.png', '2004-05-07', '강원도 춘천시');  
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('pham', '123', '팜하니', 'hani@naver.com', '하니.png', '2004-10-06', '멜버른');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('dan', '123', '모지혜', 'dani@naver.com', '다니엘.png', '2005-04-11', '뉴캐슬'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('kang', '123', '강해린', 'kang@naver.com', '해린.png', '2006-05-15', '서울시 강남구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('lee', '123', '이혜인', 'lee@naver.com', '해인.png', '2008-04-21', '인천광역시 문학동'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('bin', '123', '강성빈', 'bin@naver.com', 'kang.png', '1994-08-25', '서울시 강서구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('zico', '123', '지아코', 'zico@naver.com', 'gico.png', '1992-09-14', '서울시 지아코'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('han', '123', '한지민', 'han@naver.com', 'han.png', '1982-11-05', '서울시 지민구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('song', '123', '송중기', 'song@naver.com', 'song.png', '1986-11-05', '서울시 송중구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('park', '123', '박보검', 'park@naver.com', 'park.png', '1993-07-11', '서울시 강남구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('lim', '123', '임요환', 'lim@naver.com', 'lim.png', '1981-12-14', '서울시 테사기'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('min', '123', '민희진', 'min@naver.com', '민희진.png', '1979-12-16', '서울시 강남구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('aim', '123', '아이묭', 'aim@naver.com', '아이묭.png', '1995-03-06', '일본 효고현'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('hee', '123', '김태희', 'hee@naver.com', 'kim.png', '1980-03-29', '부산시 동래구'); 
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('son', '123', '손흥민', 'son@naver.com', 'son.png', '1992-07-08', '강원도 춘천시'); 

SELECT * FROM MEMBER;
COMMIT;
------------------------------------------------------
--            관리자 ADMIN                     
------------------------------------------------------

-- DUMMY DATA
INSERT INTO ADMIN (aID, aPW, aNAME, aCODE)
    VALUES ('admin', '111', '강성빈', '143');

SELECT * FROM ADMIN;
COMMIT;
------------------------------------------------------
--            공지사항 게시판 NoticeBoard                 
------------------------------------------------------
-- DUMMY DATA
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지사항', '금일 점심진료는 내부공사로 인해 안하게 되었습니다.', '192.168.0.1');
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지사항1', '공지내용1', '192.168.0.1');    
INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)
    VALUES (NOTICEBOARD_SEQ.NEXTVAL, 'admin', '공지사항2', '공지내용2', '192.168.0.1');    

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

INSERT INTO MRBOARD (MRNO, MID, AID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, null, 'admin', '[답]네 확인했습니다', '그 시간에 오셔요', 3,1,1, '210.2.2');


SELECT * FROM MRBOARD;
COMMIT;

------------------------------------------------------
--            후기 게시판 ReviewBoard                     
------------------------------------------------------
-- DUMMY DATA (원글)
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'kim', null, '후기글1', '친절해요', 'son.jpg', '192.168.10.151');
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'pham', null, '후기글2', '친절해요', 'han.jpg', '192.168.10.151');
INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)
    VALUES (RVBOARD_SEQ.NEXTVAL, 'dan', null, '후기글3', '친절해요', null, '192.168.10.151');

SELECT * FROM RVBOARD;
COMMIT;