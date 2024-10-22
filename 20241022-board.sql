--1. 테이블 생성
create table board_member (
	id	varchar2(50)		not null,
	password	char(128)		not null,
	username	varchar2(50)		not null,
	nickname	varchar2(50)		not null
);

create table board (
	bno	number		not null,
	id	varchar2(50)		not null,
	title	varchar2(150)		not null,
	content	clob		not null,
	write_date	date	default sysdate	not null,
	write_update_date	date	default sysdate	not null,
	bcount	number	default 0	null
);

create table board_content_like (
	bno	number		not null,
	id	varchar2(50)		not null
);

create table board_content_hate (
	bno	number		not null,
	id	varchar2(50)		not null
);

create table board_file (
	fno	char(10)		not null,
	bno	number		not null,
	fpath	varchar2(256)		null
);

create table board_comment (
	cno	number		not null,
	bno	number		not null,
	id	varchar2(50)		not null,
	content	varchar2(1000)		null,
	cdate	date	default sysdate	null
);

create table board_comment_like (
	id	varchar2(50)		not null,
	cno	number		not null
);

create table board_comment_hate (
	id	varchar2(50)		not null,
	cno	number		not null
);

--2. 제약조건(기본키, 외래키)

ALTER TABLE board_member ADD CONSTRAINT PK_BOARD_MEMBER 
PRIMARY KEY (id);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY(bno);

ALTER TABLE board_content_like 
ADD CONSTRAINT PK_BOARD_CONTENT_LIKE PRIMARY KEY(bno,id);

ALTER TABLE board_content_hate 
ADD CONSTRAINT PK_BOARD_CONTENT_HATE PRIMARY KEY(bno,id);

ALTER TABLE board_file 
ADD CONSTRAINT PK_BOARD_FILE PRIMARY KEY (fno);

ALTER TABLE board_comment 
ADD CONSTRAINT PK_BOARD_COMMENT PRIMARY KEY(cno);

ALTER TABLE board_comment_like 
ADD CONSTRAINT PK_BOARD_COMMENT_LIKE PRIMARY KEY (id,cno);

ALTER TABLE board_comment_hate 
ADD CONSTRAINT PK_BOARD_COMMENT_HATE PRIMARY KEY (id,cno);

ALTER TABLE board ADD CONSTRAINT FK_board_member_TO_board_1 FOREIGN KEY (
	id
)
REFERENCES board_member (
	id
);

ALTER TABLE board_content_like ADD CONSTRAINT FK_board_TO_board_content_like_1 FOREIGN KEY (
	bno
)
REFERENCES board (
	bno
);

ALTER TABLE board_content_like ADD CONSTRAINT FK_board_member_TO_board_content_like_1 FOREIGN KEY (
	id
)
REFERENCES board_member (
	id
);

ALTER TABLE board_content_hate ADD CONSTRAINT FK_board_TO_board_content_hate_1 FOREIGN KEY (
	bno
)
REFERENCES board (
	bno
);

ALTER TABLE board_content_hate ADD CONSTRAINT FK_board_member_TO_board_content_hate_1 FOREIGN KEY (
	id
)
REFERENCES board_member (
	id
);

ALTER TABLE board_file ADD CONSTRAINT FK_board_TO_board_file_1 FOREIGN KEY (
	bno
)
REFERENCES board (
	bno
);

ALTER TABLE board_comment ADD CONSTRAINT FK_board_TO_board_comment_1 FOREIGN KEY (
	bno
)
REFERENCES board (
	bno
);

ALTER TABLE board_comment ADD CONSTRAINT FK_board_member_TO_board_comment_1 FOREIGN KEY (
	id
)
REFERENCES board_member (
	id
);

ALTER TABLE board_comment_like ADD CONSTRAINT FK_board_member_TO_board_comment_like_1 FOREIGN KEY (
	id
)
REFERENCES board_member (
	id
);

ALTER TABLE board_comment_like ADD CONSTRAINT FK_board_comment_TO_board_comment_like_1 FOREIGN KEY (
	cno
)
REFERENCES board_comment (
	cno
);

ALTER TABLE board_comment_hate ADD CONSTRAINT FK_board_member_TO_board_comment_hate_1 FOREIGN KEY (
	id
)
REFERENCES board_member (
	id
);

ALTER TABLE board_comment_hate ADD CONSTRAINT FK_board_comment_TO_board_comment_hate_1 FOREIGN KEY (
	cno
)
REFERENCES board_comment (
	cno
);
--3. 시퀸스 생성

--4. 샘플 데이터 저장


