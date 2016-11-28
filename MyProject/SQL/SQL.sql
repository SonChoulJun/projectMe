CREATE SEQUENCE SEQ_BT_USER_NO   INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_ACTIVITY_NO   INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_FOLLOWER_NO   INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_CMT_NO  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_ALRAM_NO  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_TM_NO  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_PF_NO  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE SEQ_BT_PHOTO_NO INCREMENT BY 1 START WITH 10000;


/* 사진저장소 */
CREATE TABLE BT_PHOTO_FOLDER (
  PF_NO INT NOT NULL, /* 사진저장소일련번호 */
  USER_NO INT NOT NULL, /* 유저일련번호 */
  TITLE VARCHAR2(100), /* 여행타이틀 */
  TEXT CLOB, /* 여행지도설명 */
  FOLDER_DATE DATE NOT NULL /* 사진폴더생성날짜 */
);

COMMENT ON TABLE BT_PHOTO_FOLDER IS '사진저장소';

COMMENT ON COLUMN BT_PHOTO_FOLDER.PF_NO IS '사진저장소일련번호';

COMMENT ON COLUMN BT_PHOTO_FOLDER.USER_NO IS '유저일련번호';

COMMENT ON COLUMN BT_PHOTO_FOLDER.TITLE IS '여행타이틀';

COMMENT ON COLUMN BT_PHOTO_FOLDER.TEXT IS '여행지도설명';

COMMENT ON COLUMN BT_PHOTO_FOLDER.DATE IS '사진폴더생성날짜';

CREATE UNIQUE INDEX PK_BT_PHOTO_FOLDER
  ON BT_PHOTO_FOLDER (
    PF_NO ASC
  );

CREATE INDEX IX_BT_PHOTO_FOLDER
  ON BT_PHOTO_FOLDER (
    USER_NO ASC
  );

ALTER TABLE BT_PHOTO_FOLDER
  ADD
    CONSTRAINT PK_BT_PHOTO_FOLDER
    PRIMARY KEY (
      PF_NO
    );

/* 유저정보 */
CREATE TABLE BT_USER (
  USER_NO INT NOT NULL, /* 유저일련번호 */
  USERID VARCHAR2(50) NOT NULL, /* 유저아이디 */
  USER_NM VARCHAR2(50) NOT NULL, /* 유저이름 */
  PASSWORD VARCHAR2(50) NOT NULL, /* 패스워드 */
  PHONE VARCHAR2(30) NOT NULL, /* 전화번호 */
  ACTIVITY CHAR(1), /* 탈퇴여부 */
  JOIN_DATE DATE NOT NULL, /* 가입날짜 */
  ALRAM_ACTIVITY CHAR(1), /* 알람수신여부 */
  ALRAM_COUNT INT DEFAULT 0 /* 수신받은 알람수 */
);

COMMENT ON TABLE BT_USER IS '유저정보';

COMMENT ON COLUMN BT_USER.USER_NO IS '유저일련번호';

COMMENT ON COLUMN BT_USER.USERID IS '유저아이디';

COMMENT ON COLUMN BT_USER.USER_NM IS '유저이름';

COMMENT ON COLUMN BT_USER.PASSWORD IS '패스워드';

COMMENT ON COLUMN BT_USER.PHONE IS '전화번호';

COMMENT ON COLUMN BT_USER.ACTIVITY IS '탈퇴여부';

COMMENT ON COLUMN BT_USER.JOIN_DATE IS '가입날짜';

COMMENT ON COLUMN BT_USER.ALRAM_ACTIVITY IS '알람수신여부';

COMMENT ON COLUMN BT_USER.ALRAM_COUNT IS '수신받은 알람수';

CREATE UNIQUE INDEX PK_BT_USER
  ON BT_USER (
    USER_NO ASC
  );

CREATE UNIQUE INDEX UIX_BT_USER
  ON BT_USER (
    USERID ASC
  );

ALTER TABLE BT_USER
  ADD
    CONSTRAINT PK_BT_USER
    PRIMARY KEY (
      USER_NO
    );

ALTER TABLE BT_USER
  ADD
    CONSTRAINT UK_BT_USER
    UNIQUE (
      USERID
    );

/* 알람 */
CREATE TABLE BT_ALRAM (
  ALRAM_NO INT NOT NULL, /* 알람일련번호 */
  PF_NO INT, /* 사진저장소일련번호 */
  USER_NO INT NOT NULL, /* 유저일련번호 */
  SEND_ID VARCHAR2(50) NOT NULL, /* 알람을 보낸아이디 */
  TEXT CLOB NOT NULL, /* 알람내용 */
  ALTAM_DATE DATE NOT NULL /* 알람날짜 */
);

COMMENT ON TABLE BT_ALRAM IS '알람';

COMMENT ON COLUMN BT_ALRAM.ALRAM_NO IS '알람일련번호';

COMMENT ON COLUMN BT_ALRAM.PF_NO IS '사진저장소일련번호';

COMMENT ON COLUMN BT_ALRAM.USER_NO IS '유저일련번호';

COMMENT ON COLUMN BT_ALRAM.SEND_ID IS '알람을 보낸아이디';

COMMENT ON COLUMN BT_ALRAM.TEXT IS '알람내용';

COMMENT ON COLUMN BT_ALRAM.ALTAM_DATE IS '알람날짜';

CREATE UNIQUE INDEX PK_BT_ALRAM
  ON BT_ALRAM (
    ALRAM_NO ASC
  );

ALTER TABLE BT_ALRAM
  ADD
    CONSTRAINT PK_BT_ALRAM
    PRIMARY KEY (
      ALRAM_NO
    );

/* 댓글 */
CREATE TABLE BT_COMMENT (
  CMT_NO INT NOT NULL, /* 댓글일련번호 */
  PF_NO INT NOT NULL, /* 사진저장소일련번호 */
  USER_NO INT NOT NULL, /* 유저일련번호 */
  TEXT CLOB NOT NULL, /* 내용 */
  COMMENT_DATE DATE NOT NULL /* 댓글입력날짜 */
);

COMMENT ON TABLE BT_COMMENT IS '댓글';

COMMENT ON COLUMN BT_COMMENT.CMT_NO IS '댓글일련번호';

COMMENT ON COLUMN BT_COMMENT.PF_NO IS '사진저장소일련번호';

COMMENT ON COLUMN BT_COMMENT.USER_NO IS '유저일련번호';

COMMENT ON COLUMN BT_COMMENT.TEXT IS '내용';

COMMENT ON COLUMN BT_COMMENT.COMMENT_DATE IS '댓글입력날짜';

CREATE UNIQUE INDEX PK_BT_COMMENT
  ON BT_COMMENT (
    CMT_NO ASC
  );

CREATE INDEX IX_BT_COMMENT
  ON BT_COMMENT (
    USER_NO ASC
  );

ALTER TABLE BT_COMMENT
  ADD
    CONSTRAINT PK_BT_COMMENT
    PRIMARY KEY (
      CMT_NO
    );

/* 팔로워 */
CREATE TABLE BT_FOLLOWER (
  FOLLOWER_NO INT NOT NULL, /* 팔로워일련번호 */
  FOLLOWER_USER_NO INT NOT NULL, /* 팔로워받은아이디 */
  FOLLOWING_USER_NO INT /* 팔로워한아이디 */
);

COMMENT ON TABLE BT_FOLLOWER IS '팔로워';

COMMENT ON COLUMN BT_FOLLOWER.FOLLOWER_NO IS '팔로워일련번호';

COMMENT ON COLUMN BT_FOLLOWER.FOLLOWER_USER_NO IS '팔로워받은아이디';

COMMENT ON COLUMN BT_FOLLOWER.FOLLOWING_USER_NO IS '팔로워한아이디';

CREATE UNIQUE INDEX PK_BT_FOLLOWER
  ON BT_FOLLOWER (
    FOLLOWER_NO ASC
  );

CREATE INDEX IX_BT_FOLLOWER
  ON BT_FOLLOWER (
    FOLLOWER_USER_NO ASC
  );

ALTER TABLE BT_FOLLOWER
  ADD
    CONSTRAINT PK_BT_FOLLOWER
    PRIMARY KEY (
      FOLLOWER_NO
    );

/* 사진 */
CREATE TABLE BT_PHOTO (
  PHOTO_NO INT NOT NULL, /* 사진일련번호 */
  POINT CHAR(1) NOT NULL, /* 중심사진여부 */
  TM_NO INT, /* 사진테마 */
  SV_FD VARCHAR2(50) NOT NULL, /* 사진저장폴더 */
  TEXT CLOB, /* 내용 */
  TITLE VARCHAR2(100), /* 제목 */
  PHOTO_DATE DATE, /* 찍은날짜 */
  GPS_B VARCHAR2(30), /* gps(위도) */
  GPS_H VARCHAR2(30) /* gps(경도) */
);

COMMENT ON TABLE BT_PHOTO IS '사진';

COMMENT ON COLUMN BT_PHOTO.PHOTO_NO IS '사진일련번호';

COMMENT ON COLUMN BT_PHOTO.POINT IS '중심사진여부';

COMMENT ON COLUMN BT_PHOTO.TM_NO IS '사진테마';

COMMENT ON COLUMN BT_PHOTO.SV_FD IS '사진저장폴더';

COMMENT ON COLUMN BT_PHOTO.TEXT IS '내용';

COMMENT ON COLUMN BT_PHOTO.TITLE IS '제목';

COMMENT ON COLUMN BT_PHOTO.PHOTO_DATE IS '찍은날짜';

COMMENT ON COLUMN BT_PHOTO.GPS_B IS 'gps(위도)';

COMMENT ON COLUMN BT_PHOTO.GPS_H IS 'gps(경도)';

CREATE UNIQUE INDEX PK_BT_PHOTO
  ON BT_PHOTO (
    PHOTO_NO ASC
  );

CREATE INDEX IX_BT_PHOTO
  ON BT_PHOTO (
  );

CREATE INDEX IX_BT_PHOTO2
  ON BT_PHOTO (
    POINT ASC
  );

ALTER TABLE BT_PHOTO
  ADD
    CONSTRAINT PK_BT_PHOTO
    PRIMARY KEY (
      PHOTO_NO
    );

/* 유저 활동로그 */
CREATE TABLE BT_ACTIVITY (
  ACTIVITY_NO INT NOT NULL, /* activityNum */
  USER_NO INT NOT NULL, /* 유저일련번호 */
  ACTIVITY_DATE DATE NOT NULL, /* 활동날짜 */
  TEXT CLOB NOT NULL /* 내용 */
);

COMMENT ON TABLE BT_ACTIVITY IS '유저 활동로그';

COMMENT ON COLUMN BT_ACTIVITY.ACTIVITY_NO IS 'activityNum';

COMMENT ON COLUMN BT_ACTIVITY.USER_NO IS '유저일련번호';

COMMENT ON COLUMN BT_ACTIVITY.ACTIVITY_DATE IS '활동날짜';

COMMENT ON COLUMN BT_ACTIVITY.TEXT IS '내용';

CREATE UNIQUE INDEX PK_BT_ACTIVITY
  ON BT_ACTIVITY (
    ACTIVITY_NO ASC
  );

CREATE INDEX IX_BT_ACTIVITY
  ON BT_ACTIVITY (
    USER_NO ASC
  );

ALTER TABLE BT_ACTIVITY
  ADD
    CONSTRAINT PK_BT_ACTIVITY
    PRIMARY KEY (
      ACTIVITY_NO
    );

/* 좋아요 */
CREATE TABLE BT_LIKE (
  PF_NO INT NOT NULL, /* 사진저장소일련번호 */
  USER_NO INT NOT NULL /* 유저일련번호 */
);

COMMENT ON TABLE BT_LIKE IS '좋아요';

COMMENT ON COLUMN BT_LIKE.PF_NO IS '사진저장소일련번호';

COMMENT ON COLUMN BT_LIKE.USER_NO IS '유저일련번호';

CREATE UNIQUE INDEX PK_BT_LIKE
  ON BT_LIKE (
    PF_NO ASC,
    USER_NO ASC
  );

CREATE INDEX IX_BT_LIKE
  ON BT_LIKE (
    USER_NO ASC
  );

ALTER TABLE BT_LIKE
  ADD
    CONSTRAINT PK_BT_LIKE
    PRIMARY KEY (
      PF_NO,
      USER_NO
    );

/* 테마테이블 */
CREATE TABLE BT_TM (
  TM_NO INT NOT NULL, /* 사진테마 */
  PF_NO INT NOT NULL, /* 사진저장소일련번호 */
  TM_NM VARCHAR2(100) NOT NULL /* 테마명 */
);

COMMENT ON TABLE BT_TM IS '테마테이블';

COMMENT ON COLUMN BT_TM.TM_NO IS '사진테마';

COMMENT ON COLUMN BT_TM.PF_NO IS '사진저장소일련번호';

COMMENT ON COLUMN BT_TM.TM_NM IS '테마명';

CREATE UNIQUE INDEX PK_BT_TM
  ON BT_TM (
    TM_NO ASC
  );

ALTER TABLE BT_TM
  ADD
    CONSTRAINT PK_BT_TM
    PRIMARY KEY (
      TM_NO
    );

ALTER TABLE BT_PHOTO_FOLDER
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_PHOTO_FOLDER
    FOREIGN KEY (
      USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_ALRAM
  ADD
    CONSTRAINT FK_BT_PHOTO_FOLDER_TO_BT_ALRAM
    FOREIGN KEY (
      PF_NO
    )
    REFERENCES BT_PHOTO_FOLDER (
      PF_NO
    );

ALTER TABLE BT_ALRAM
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_ALRAM
    FOREIGN KEY (
      USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_COMMENT
  ADD
    CONSTRAINT FK_BT_PHOTO_FOLDER_TO_BT_COMMENT
    FOREIGN KEY (
      PF_NO
    )
    REFERENCES BT_PHOTO_FOLDER (
      PF_NO
    );

ALTER TABLE BT_COMMENT
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_COMMENT
    FOREIGN KEY (
      USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_FOLLOWER
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_FOLLOWER
    FOREIGN KEY (
      FOLLOWER_USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_FOLLOWER
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_FOLLOWER2
    FOREIGN KEY (
      FOLLOWING_USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_PHOTO
  ADD
    CONSTRAINT FK_BT_TM_TO_BT_PHOTO
    FOREIGN KEY (
      TM_NO
    )
    REFERENCES BT_TM (
      TM_NO
    );

ALTER TABLE BT_ACTIVITY
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_ACTIVITY
    FOREIGN KEY (
      USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_LIKE
  ADD
    CONSTRAINT FK_BT_PHOTO_FOLDER_TO_BT_LIKE
    FOREIGN KEY (
      PF_NO
    )
    REFERENCES BT_PHOTO_FOLDER (
      PF_NO
    );

ALTER TABLE BT_LIKE
  ADD
    CONSTRAINT FK_BT_USER_TO_BT_LIKE
    FOREIGN KEY (
      USER_NO
    )
    REFERENCES BT_USER (
      USER_NO
    );

ALTER TABLE BT_TM
  ADD
    CONSTRAINT FK_BT_PHOTO_FOLDER_TO_BT_TM
    FOREIGN KEY (
      PF_NO
    )
    REFERENCES BT_PHOTO_FOLDER (
      PF_NO
    );