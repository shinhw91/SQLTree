--DB �ʱ�ȭ
drop table review;
drop table detail;
drop table orders;
drop table cart;
--drop table goods;
drop table member;

drop sequence detail_seq;
drop sequence cart_seq;
drop sequence review_seq;

--ERDCloud
CREATE TABLE member (
	member_code	varchar2(100)		NOT NULL,
	id	varchar2(100)		NULL,
	pw	varchar2(100)		NULL,
	member_name	varchar2(100)		NULL,
	member_phone	varchar2(100)		NULL,
	member_address	varchar2(100)		NULL,
	email	varchar2(100)		NULL
);

CREATE TABLE goods (
	goods_code	varchar2(100)		NOT NULL,
	goods_name	varchar2(100)		NULL,
	company	varchar2(100)		NULL,
	price	number		NULL,
	category	varchar2(100)		NULL,
	thumb_image	varchar2(100)		NULL,
	detail_image	varchar2(100)		NULL,
	weight	number		NULL,
	unit	varchar2(100)		NULL,
	allergy	varchar2(100)		NULL,
	calorie	number		NULL,
	na	number		NULL,
	carbo	number		NULL,
	sugar	number		NULL,
	sfat	number		NULL,
	protein	number		NULL
);

CREATE TABLE orders (
	order_code	varchar2(100)		NOT NULL,
	member_code	varchar2(100)		NULL,
	order_date	varchar2(100)		NULL,
	order_address	varchar2(500)		NULL,
	order_name	varchar2(100)		NULL,
	order_phone	varchar2(100)		NULL,
	memo	varchar2(500)		NULL,
	delivery_fee	number		NULL,
	total_price	number		NULL
);

CREATE TABLE review (
	review_code	number		NOT NULL,
	goods_code	varchar2(100)		NOT NULL,
	member_code	varchar2(100)		NULL,               
	title	varchar2(500)		NULL,
	content	clob		NULL,
	stars	number		NULL,
	review_date	varchar2(100)		NULL
);

CREATE TABLE cart (
	cart_code	number		NOT NULL,
	goods_code	varchar2(100)		NOT NULL,
	member_code	varchar2(100)		NULL,
	quantity	number		NULL
);

CREATE TABLE detail (
	detail_code	varchar2(100)		NOT NULL,
	order_code	varchar2(100)		NOT NULL,
	goods_code	varchar2(100)		NOT NULL,
	quantity	number		NULL,
	detail_price	number		NULL
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_code
);

ALTER TABLE goods ADD CONSTRAINT PK_GOODS PRIMARY KEY (
	goods_code
);

ALTER TABLE orders ADD CONSTRAINT PK_ORDERS PRIMARY KEY (
	order_code
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_code
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	cart_code
);

ALTER TABLE detail ADD CONSTRAINT PK_DETAIL PRIMARY KEY (
	detail_code
);

ALTER TABLE review ADD CONSTRAINT FK_goods_TO_review_1 FOREIGN KEY (
	goods_code
)
REFERENCES goods (
	goods_code
);

ALTER TABLE cart ADD CONSTRAINT FK_goods_TO_cart_1 FOREIGN KEY (
	goods_code
)
REFERENCES goods (
	goods_code
);

ALTER TABLE detail ADD CONSTRAINT FK_orders_TO_detail_1 FOREIGN KEY (
	order_code
)
REFERENCES orders (
	order_code
);

ALTER TABLE detail ADD CONSTRAINT FK_goods_TO_detail_1 FOREIGN KEY (
	goods_code
)
REFERENCES goods (
	goods_code
);

--��������
insert into member values('M-00001', 'user1', '0000', 'ȸ��1', '010-1111-1111', '�뱸�� �߱� �߾Ӵ��', 'user1@naver.com');
insert into member values('M-00002', 'user2', '0000', 'ȸ��2', '010-2222-2222', '�뱸�� �߱� �߾Ӵ��', 'user2@naver.com');
insert into member values('M-00003', 'user3', '0000', 'ȸ��3', '010-3333-3333', '�뱸�� �߱� �߾Ӵ��', 'user3@naver.com');
insert into member values('M-00004', 'user4', '0000', 'ȸ��4', '010-4444-4444', '�뱸�� �߱� �߾Ӵ��', 'user4@naver.com');
insert into member values('M-00005', 'user5', '0000', 'ȸ��5', '010-5555-5555', '�뱸�� �߱� �߾Ӵ��', 'user5@naver.com');
insert into member values('M-00006', 'user6', '0000', 'ȸ��6', '010-6666-6666', '�뱸�� �߱� �߾Ӵ��', 'user6@naver.com');
insert into member values('M-00007', 'user7', '0000', 'ȸ��7', '010-7777-7777', '�뱸�� �߱� �߾Ӵ��', 'user7@naver.com');
insert into member values('M-00008', 'user8', '0000', 'ȸ��8', '010-8888-8888', '�뱸�� �߱� �߾Ӵ��', 'user8@naver.com');
insert into member values('M-00009', 'user9', '0000', 'ȸ��9', '010-9999-9999', '�뱸�� �߱� �߾Ӵ��', 'user9@naver.com');
insert into member values('M-00010', 'user10', '0000', 'ȸ��10', '010-0000-0000', '�뱸�� �߱� �߾Ӵ��', 'user10@naver.com');

--insert into goods values('G-00001', '��ǰ1', '����', 1000, '����/��Ű', '�����.png', '�����.png');
--insert into goods values('G-00002', '��ǰ2', '����', 2000, '����/��Ű', '�����.png', '�����.png');
--insert into goods values('G-00003', '��ǰ3', '����', 3000, '����/��Ű', '�����.png', '�����.png');
--insert into goods values('G-00004', '��ǰ4', '����', 4000, '���ݸ�/����', '�����.png', '�����.png');
--insert into goods values('G-00005', '��ǰ5', '����', 5000, '���ݸ�/����', '�����.png', '�����.png');
--insert into goods values('G-00006', '��ǰ6', '����', 6000, '���ݸ�/����', '�����.png', '�����.png');
--insert into goods values('G-00007', '��ǰ7', '����', 7000, 'ĵ��/��', '�����.png', '�����.png');
--insert into goods values('G-00008', '��ǰ8', '����', 8000, 'ĵ��/��', '�����.png', '�����.png');
--insert into goods values('G-00009', '��ǰ9', '����', 9000, 'ĵ��/��', '�����.png', '�����.png');
--insert into goods values('G-00010', '��ǰ10', '����', 10000, '����/Ŀ��', '�����.png', '�����.png');
--insert into goods values('G-00011', '��ǰ11', '����', 11000, '����/Ŀ��', '�����.png', '�����.png');
--insert into goods values('G-00012', '��ǰ12', '����', 12000, '����/Ŀ��', '�����.png', '�����.png');

create sequence cart_seq;

insert into cart values(cart_seq.nextval, 'G-00001', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00002', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00003', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00004', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00005', 'M-00001', 1);
insert into cart values(cart_seq.nextval, 'G-00006', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00007', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00008', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00009', 'M-00002', 1);
insert into cart values(cart_seq.nextval, 'G-00010', 'M-00002', 1);

insert into orders values('O-00001', 'M-00001', '2024-01-01', '����� ���ı� �ø��ȷ�', '������1', '010-1234-1234', '����� �� �տ� �����ּ���', 3000, 15000);
insert into orders values('O-00002', 'M-00002', '2024-05-05', '����� ���ı� �ø��ȷ�', '������2', '010-5678-5678', '���ǿ� �ð��ּ���', 0, 45000);

create sequence detail_seq;

insert into detail values(detail_seq.nextval, 'O-00001', 'G-00001', 1, 1000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00002', 1, 2000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00003', 1, 3000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00004', 1, 4000);
insert into detail values(detail_seq.nextval, 'O-00001', 'G-00005', 1, 5000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00006', 1, 6000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00007', 1, 7000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00008', 1, 8000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00009', 1, 9000);
insert into detail values(detail_seq.nextval, 'O-00002', 'G-00010', 1, 10000);

create sequence review_seq;

insert into review values(review_seq.nextval, 'G-00001', 'M-00001', '��ǰ��1', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 1, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00002', 'M-00001', '��ǰ��2', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 1, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00003', 'M-00001', '��ǰ��3', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 2, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00004', 'M-00001', '��ǰ��4', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 2, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00005', 'M-00001', '��ǰ��5', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 3, '2024-01-05');
insert into review values(review_seq.nextval, 'G-00006', 'M-00002', '��ǰ��6', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 3, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00007', 'M-00002', '��ǰ��7', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 4, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00008', 'M-00002', '��ǰ��8', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 4, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00009', 'M-00002', '��ǰ��9', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 5, '2024-05-12');
insert into review values(review_seq.nextval, 'G-00010', 'M-00002', '��ǰ��10', '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.', 5, '2024-05-12');

-- ���̺� ��ȸ
select * from member order by 1;
select * from goods order by 1;
select * from cart order by 1;
select * from detail order by 1;
select * from orders order by 1;
select * from review order by 1;

commit;

select * from goods where goods_name like '%��%';��', '�����.png', '�����.png');