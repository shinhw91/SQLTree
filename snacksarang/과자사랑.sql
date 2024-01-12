DROP TABLE member;

CREATE TABLE member (
	m_code	varchar2(100)		NOT NULL,
	id	varchar2(100)		NULL,
	pw	varchar2(100)		NULL,
	m_name	varchar2(100)		NULL,
	m_phone	varchar2(100)		NULL,
	m_address	varchar2(100)		NULL,
	email	varchar2(100)		NULL
);

DROP TABLE goods;

CREATE TABLE goods (
	g_code	varchar2(100)		NOT NULL,
	g_name	varchar2(100)		NULL,
	price	number		NULL,
	made	varchar2(100)		NULL,
	thumb	varchar2(100)		NULL,
	img	varchar2(100)		NULL,
	category	varchar2(100)		NULL
);

DROP TABLE orders;

CREATE TABLE orders (
	o_code	varchar2(100)		NOT NULL,
	m_code	varchar2(100)		NULL,
	o_date	varchar2(100)		NULL,
	o_address	varchar2(100)		NULL,
	o_name	varchar2(100)		NULL,
	o_phone	varchar2(100)		NULL,
	memo	varchar2(500)		NULL,
	fee	number		NULL,
	total	number		NULL
);

DROP TABLE review;

CREATE TABLE review (
	r_no	number		NOT NULL,
	g_code	varchar2(100)		NOT NULL,
	title	varchar2(500)		NULL,
	contemt	clob		NULL,
	r_star	number		NULL,
	r_date	varchar2(100)		NULL
);

DROP TABLE cart;

CREATE TABLE cart (
	c_no	number		NOT NULL,
	g_code	varchar2(100)		NOT NULL,
	m_code	varchar2(100)		NULL,
	cnt	number		NULL
);

DROP TABLE detail;

CREATE TABLE detail (
	d_no	varchar2(100)		NOT NULL,
	g_code	varchar2(100)		NOT NULL,
	o_code	varchar2(100)		NOT NULL,
	cnt	number		NULL,
	d_price	number		NULL
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	m_code
);

ALTER TABLE goods ADD CONSTRAINT PK_GOODS PRIMARY KEY (
	g_code
);

ALTER TABLE orders ADD CONSTRAINT PK_ORDERS PRIMARY KEY (
	o_code
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	r_no,
	g_code
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	c_no,
	g_code
);

ALTER TABLE detail ADD CONSTRAINT PK_DETAIL PRIMARY KEY (
	d_no,
	g_code,
	o_code
);

select * from member;
insert into member values('m-00001', 'user1', '0000', '고객1', '010-1111-1111', '대구시 중구', 'user1@naver.com');
insert into member values('m-00002', 'user2', '0000', '고객2', '010-2222-2222', '대구시 중구', 'user1@naver.com');
insert into member values('m-00003', 'user3', '0000', '고객3', '010-3333-3333', '대구시 중구', 'user1@naver.com');
insert into member values('m-00004', 'user4', '0000', '고객4', '010-4444-4444', '대구시 중구', 'user1@naver.com');
insert into member values('m-00005', 'user5', '0000', '고객5', '010-5555-5555', '대구시 중구', 'user1@naver.com');
insert into member values('m-00006', 'user6', '0000', '고객6', '010-6666-6666', '대구시 중구', 'user1@naver.com');
insert into member values('m-00007', 'user7', '0000', '고객7', '010-7777-7777', '대구시 중구', 'user1@naver.com');
insert into member values('m-00008', 'user8', '0000', '고객8', '010-8888-8888', '대구시 중구', 'user1@naver.com');
insert into member values('m-00009', 'user9', '0000', '고객9', '010-9999-9999', '대구시 중구', 'user1@naver.com');
insert into member values('m-00010', 'user10', '0000', '고객10', '010-0000-0000', '대구시 중구', 'user1@naver.com');

commit;


