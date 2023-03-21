------------------------------------------------------
--            회원정보 MEMBER                     
------------------------------------------------------
-- DUMMY DATA
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('aaa', '123', '강길동', 'Kang@NN.COM', 'NOIMG.JPG', '1994-08-25', '강서구 가양동');  
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('bbb', '123', '손길동', 'Hong@HH.COM', 'son.JPG', '1992-05-30', '강남구 논현동');
INSERT INTO MEMBER (mID, mPW, mNAME, mEMAIL, mPHOTO, mBIRTH, mADDRESS)
    VALUES ('ccc', '123', '강길순', 'soon@ss.COM', 'kim.JPG', '1982-05-30', '강서구 등촌동');   
 

SELECT * FROM MEMBER;
COMMIT;

------------------------------------------------------
--            관리자 ADMIN                     
------------------------------------------------------

-- DUMMY DATA
INSERT INTO ADMIN (aID, aPW, aNAME, aCODE)
    VALUES ('admin', '143', '관리자', '111');
INSERT INTO ADMIN (aID, aPW, aNAME, aCODE)
    VALUES ('admin1', '123', '관리자1', '111');

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
    VALUES (MRBOARD_SEQ.NEXTVAL, 'aaa', null, '예약글1', '예약내용1', MRBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'bbb', null, '예약글2', '예약내용2', MRBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'ccc', null, '예약글3', '예약내용3', MRBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');

-- 위 2번글에 대한 답변글
INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, null, 'admin', '[답]답글이용', '예약해드림', 15, 1, 1, '210.2.2');

INSERT INTO MRBOARD (MRNO, mID, aID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)
    VALUES (MRBOARD_SEQ.NEXTVAL, 'ccc', null, '예약글3', '예약내용3', MRBOARD_SEQ.CURRVAL, 0, 0, '201.1.1');


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