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

--3. 시퀸스 생성

--4. 샘플 데이터 저장


