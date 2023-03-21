-- 테이블 & 시퀀스 DROP 및 CREATE

---------------------------------------------------
----------------- 회원정보 MEMBER--------------------                 
----------------------------------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER (
    mID VARCHAR2(50) PRIMARY KEY,        -- 회원 아이디
    mPW VARCHAR2(50) NOT NULL,           -- 회원 비밀번호
    mNAME VARCHAR2(50) NOT NULL,         -- 회원 이름
    mEMAIL VARCHAR2(30) UNIQUE,          -- 회원 이메일
    mPHOTO VARCHAR2(30) NOT NULL,        -- 회원가입시 사진업로드를 안 할시 기본 이미지로(NOIMG.JPG)
    mBIRTH DATE,                         -- 회원 생년월일
    mADDRESS VARCHAR2(300),              -- 회원 주소
    mRDATE DATE DEFAULT SYSDATE NOT NULL -- 회원가입일
);

SELECT * FROM MEMBER;
COMMIT;
------------------------------------------------------
--            관리자 ADMIN                     
------------------------------------------------------
DROP TABLE ADMIN CASCADE CONSTRAINTS;

CREATE TABLE ADMIN(
    aID VARCHAR2(50) PRIMARY KEY,   -- 관리자 아이디
    aPW VARCHAR2(50) NOT NULL,      -- 관리자 비밀번호
    aNAME VARCHAR2(50) NOT NULL,    -- 관리자 이름
    aCODE VARCHAR2(50) NOT NULL     -- 관리자 코드
);

SELECT * FROM ADMIN;
COMMIT;
------------------------------------------------------
--            공지사항 게시판 NoticeBoard                 
------------------------------------------------------
DROP TABLE NOTICEBOARD;

CREATE TABLE NOTICEBOARD(
    nbNO NUMBER(6) PRIMARY KEY,                -- 공지사항 글번호
    aID  VARCHAR2(50) REFERENCES ADMIN(aID),   -- 관리자 아이디
    nbTITLE VARCHAR2(250) NOT NULL,            -- 공지사항 제목
    nbCONTENT VARCHAR2(4000) NOT NULL,         -- 공지사항 본문
    nbRDATE DATE DEFAULT SYSDATE,              -- 공지사항 작성시점
    nbIP VARCHAR2(30)                          -- 관리자 아이피
);

DROP SEQUENCE NOTICEBOARD_SEQ;
CREATE SEQUENCE NOTICEBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

SELECT * FROM NOTICEBOARD;
COMMIT;
------------------------------------------------------
--    진료예약 게시판 MedicalReservationBoard                     
------------------------------------------------------
DROP TABLE MRBOARD;

CREATE TABLE MRBOARD(
    mrNO NUMBER(6) PRIMARY KEY,               -- 글번호
    mID VARCHAR2(50) REFERENCES MEMBER (mID), -- 회원 아이디
    aID  VARCHAR2(50) REFERENCES ADMIN(aID),  -- 관리자 아이디
    mrTITLE VARCHAR2(200) NOT NULL,           -- 글제목
    mrCONTENT VARCHAR2(4000) NOT NULL,        -- 글본문
    mrRDATE DATE DEFAULT SYSDATE,             -- 글 작성시점
    mrHIT NUMBER(6) DEFAULT 0,                -- 조회수 
    mrGROUP NUMBER(6) NOT NULL,               -- 글그룹
    mrSTEP NUMBER(6) NOT NULL,                -- 그룹 내 출력순서
    mrINDENT NUMBER(6) NOT NULL,              -- 들여쓰기 정도
    mrIP VARCHAR2(30)                         -- 글쓴이 아이피
);

DROP SEQUENCE MRBOARD_SEQ;
CREATE SEQUENCE MRBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

SELECT * FROM MRBOARD;
COMMIT;

------------------------------------------------------
--            상담 게시판 ConsultingBoard                     
------------------------------------------------------
DROP TABLE CBBOARD;

CREATE TABLE CBBOARD(
    cbNO NUMBER(6) PRIMARY KEY,                -- 글번호
    mID VARCHAR2(50) REFERENCES MEMBER (mID),  -- 아이디
    aID  VARCHAR2(50) REFERENCES ADMIN(aID),   -- 관리자 아이디
    cbTITLE VARCHAR2(200) NOT NULL,            -- 글제목
    cbCONTENT VARCHAR2(4000) NOT NULL,         -- 글본문
    cbFILENAME VARCHAR2(100),                  -- 첨부파일 이름
    cbRDATE DATE DEFAULT SYSDATE,              -- 글 작성시점
    cbHIT NUMBER(6) DEFAULT 0,                 -- 조회수 
    cbGROUP NUMBER(6) NOT NULL,                -- 글그룹
    cbSTEP NUMBER(6) NOT NULL,                 -- 그룹 내 출력순서
    cbINDENT NUMBER(6) NOT NULL,               -- 들여쓰기 정도
    cbIP VARCHAR2(30)                          -- 글쓴이 아이피
);

DROP SEQUENCE CBBOARD_SEQ;
CREATE SEQUENCE CBBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

SELECT * FROM CBBOARD;
COMMIT;
------------------------------------------------------
--            후기 게시판 ReviewBoard                     
------------------------------------------------------

DROP TABLE RVBOARD;

CREATE TABLE RVBOARD(
    rvNO NUMBER(6) PRIMARY KEY,                -- 글번호
    mID VARCHAR2(50) REFERENCES MEMBER (mID),  -- 멤버 아이디
    aID  VARCHAR2(50) REFERENCES ADMIN(aID),   -- 관리자 아이디
    rvTITLE VARCHAR2(200) NOT NULL,            -- 글제목
    rvCONTENT VARCHAR2(4000) NOT NULL,         -- 글본문
    rvFILENAME VARCHAR2(100),                  -- 첨부파일 이름
    rvRDATE DATE DEFAULT SYSDATE,              -- 글 작성시점
    rvHIT NUMBER(6) DEFAULT 0,                 -- 조회수 
    rvIP VARCHAR2(30)                          -- 글쓴이 아이피
);

DROP SEQUENCE RVBOARD_SEQ;
CREATE SEQUENCE RVBOARD_SEQ MAXVALUE 999999 NOCACHE NOCYCLE;

SELECT * FROM MEMBER;
SELECT * FROM ADMIN;
SELECT * FROM NOTICEBOARD;
SELECT * FROM MRBOARD;
SELECT * FROM CBBOARD;
SELECT * FROM RVBOARD;
COMMIT;