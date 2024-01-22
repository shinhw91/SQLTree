--DB �ʱ�ȭ
--drop table review;
--drop table detail;
--drop table orders;
--drop table cart;
--drop table goods;
--drop table member;
--drop table likes;
--
--drop sequence detail_seq;
--drop sequence cart_seq;
--drop sequence review_seq;

--ERDCloud
CREATE TABLE member (
               member_code    VARCHAR2(100) NOT NULL,
               id             VARCHAR2(100) NULL,
               pw             VARCHAR2(100) NULL,
               member_name    VARCHAR2(100) NULL,
               member_phone   VARCHAR2(100) NULL,
               member_address VARCHAR2(100) NULL,
               email          VARCHAR2(100) NULL
);

CREATE TABLE goods (
               goods_code   VARCHAR2(100) NOT NULL,
               goods_name   VARCHAR2(100) NULL,
               company      VARCHAR2(100) NULL,
               price        NUMBER NULL,
               category     VARCHAR2(100) NULL,
               thumb_image  VARCHAR2(100) NULL,
               detail_image VARCHAR2(100) NULL,
               weight       NUMBER NULL,
               unit         VARCHAR2(100) NULL,
               allergy      VARCHAR2(100) NULL,
               calorie      NUMBER NULL,
               na           NUMBER NULL,
               carbo        NUMBER NULL,
               sugar        NUMBER NULL,
               sfat         NUMBER NULL,
               protein      NUMBER NULL
);

CREATE TABLE orders (
               order_code    VARCHAR2(100) NOT NULL,
               member_code   VARCHAR2(100) NULL,
               order_date    VARCHAR2(100) NULL,
               order_address VARCHAR2(500) NULL,
               order_name    VARCHAR2(100) NULL,
               order_phone   VARCHAR2(100) NULL,
               memo          VARCHAR2(500) NULL,
               delivery_fee  NUMBER NULL,
               total_price   NUMBER NULL
);

CREATE TABLE review (
               review_code NUMBER NOT NULL,
               goods_code  VARCHAR2(100) NOT NULL,
               member_code VARCHAR2(100) NULL,
               title       VARCHAR2(500) NULL,
               content     CLOB NULL,
               stars       NUMBER NULL,
               review_date VARCHAR2(100) NULL
);

CREATE TABLE cart (
               cart_code   NUMBER NOT NULL,
               goods_code  VARCHAR2(100) NOT NULL,
               member_code VARCHAR2(100) NULL,
               quantity    NUMBER NULL
);

CREATE TABLE detail (
               detail_code  VARCHAR2(100) NOT NULL,
               order_code   VARCHAR2(100) NOT NULL,
               goods_code   VARCHAR2(100) NOT NULL,
               quantity     NUMBER NULL,
               detail_price NUMBER NULL,
               review_code  NUMBER NULL
);

CREATE TABLE likes (
               likes_code  NUMBER NOT NULL,
               goods_code  VARCHAR2(100) NOT NULL,
               member_code VARCHAR2(100) NULL
);

ALTER TABLE member ADD CONSTRAINT pk_member PRIMARY KEY ( member_code );

ALTER TABLE goods ADD CONSTRAINT pk_goods PRIMARY KEY ( goods_code );

ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY ( order_code );

ALTER TABLE review ADD CONSTRAINT pk_review PRIMARY KEY ( review_code );

ALTER TABLE cart ADD CONSTRAINT pk_cart PRIMARY KEY ( cart_code );

ALTER TABLE detail ADD CONSTRAINT pk_detail PRIMARY KEY ( detail_code );

ALTER TABLE likes ADD CONSTRAINT pk_likes PRIMARY KEY ( likes_code );

ALTER TABLE review
               ADD CONSTRAINT fk_goods_to_review_1 FOREIGN KEY ( goods_code )
                              REFERENCES goods ( goods_code );

ALTER TABLE cart
               ADD CONSTRAINT fk_goods_to_cart_1 FOREIGN KEY ( goods_code )
                              REFERENCES goods ( goods_code );

ALTER TABLE detail
               ADD CONSTRAINT fk_orders_to_detail_1 FOREIGN KEY ( order_code )
                              REFERENCES orders ( order_code );

ALTER TABLE detail
               ADD CONSTRAINT fk_goods_to_detail_1 FOREIGN KEY ( goods_code )
                              REFERENCES goods ( goods_code );

ALTER TABLE likes
               ADD CONSTRAINT fk_goods_to_likes_1 FOREIGN KEY ( goods_code )
                              REFERENCES goods ( goods_code );







--��������
INSERT INTO member VALUES (
               'M-00001',
               'user1',
               '0000',
               'ȸ��1',
               '010-1111-1111',
               '�뱸�� �߱� �߾Ӵ��',
               'user1@naver.com'
);

INSERT INTO member VALUES (
               'M-00002',
               'user2',
               '0000',
               'ȸ��2',
               '010-2222-2222',
               '�뱸�� �߱� �߾Ӵ��',
               'user2@naver.com'
);

INSERT INTO member VALUES (
               'M-00003',
               'user3',
               '0000',
               'ȸ��3',
               '010-3333-3333',
               '�뱸�� �߱� �߾Ӵ��',
               'user3@naver.com'
);

INSERT INTO member VALUES (
               'M-00004',
               'user4',
               '0000',
               'ȸ��4',
               '010-4444-4444',
               '�뱸�� �߱� �߾Ӵ��',
               'user4@naver.com'
);

INSERT INTO member VALUES (
               'M-00005',
               'user5',
               '0000',
               'ȸ��5',
               '010-5555-5555',
               '�뱸�� �߱� �߾Ӵ��',
               'user5@naver.com'
);

INSERT INTO member VALUES (
               'M-00006',
               'user6',
               '0000',
               'ȸ��6',
               '010-6666-6666',
               '�뱸�� �߱� �߾Ӵ��',
               'user6@naver.com'
);

INSERT INTO member VALUES (
               'M-00007',
               'user7',
               '0000',
               'ȸ��7',
               '010-7777-7777',
               '�뱸�� �߱� �߾Ӵ��',
               'user7@naver.com'
);

INSERT INTO member VALUES (
               'M-00008',
               'user8',
               '0000',
               'ȸ��8',
               '010-8888-8888',
               '�뱸�� �߱� �߾Ӵ��',
               'user8@naver.com'
);

INSERT INTO member VALUES (
               'M-00009',
               'user9',
               '0000',
               'ȸ��9',
               '010-9999-9999',
               '�뱸�� �߱� �߾Ӵ��',
               'user9@naver.com'
);

INSERT INTO member VALUES (
               'M-00010',
               'user10',
               '0000',
               'ȸ��10',
               '010-0000-0000',
               '�뱸�� �߱� �߾Ӵ��',
               'user10@naver.com'
);

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

CREATE SEQUENCE cart_seq;

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00001',
               'M-00001',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00002',
               'M-00001',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00003',
               'M-00001',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00004',
               'M-00001',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00005',
               'M-00001',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00006',
               'M-00002',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00007',
               'M-00002',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00008',
               'M-00002',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00009',
               'M-00002',
               1
);

INSERT INTO cart VALUES (
               cart_seq.NEXTVAL,
               'G-00010',
               'M-00002',
               1
);

INSERT INTO orders VALUES (
               'O-00001',
               'M-00001',
               '2024-01-01',
               '����� ���ı� �ø��ȷ�',
               '������1',
               '010-1234-1234',
               '����� �� �տ� �����ּ���',
               3000,
               15000
);

INSERT INTO orders VALUES (
               'O-00002',
               'M-00002',
               '2024-05-05',
               '����� ���ı� �ø��ȷ�',
               '������2',
               '010-5678-5678',
               '���ǿ� �ð��ּ���',
               0,
               45000
);

CREATE SEQUENCE detail_seq;

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00001',
               'G-00001',
               1,
               1000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00001',
               'G-00002',
               1,
               2000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00001',
               'G-00003',
               1,
               3000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00001',
               'G-00004',
               1,
               4000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00001',
               'G-00005',
               1,
               5000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00002',
               'G-00006',
               1,
               6000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00002',
               'G-00007',
               1,
               7000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00002',
               'G-00008',
               1,
               8000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00002',
               'G-00009',
               1,
               9000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00002',
               'G-00010',
               1,
               10000
);

INSERT INTO detail (
               detail_code,
               order_code,
               goods_code,
               quantity,
               detail_price
) VALUES (
               detail_seq.NEXTVAL,
               'O-00002',
               'G-00010',
               1,
               10000
);

CREATE SEQUENCE review_seq;

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00001',
               'M-00001',
               '��ǰ��1',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               1,
               '2024-01-05'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00002',
               'M-00001',
               '��ǰ��2',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               1,
               '2024-01-05'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00003',
               'M-00001',
               '��ǰ��3',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               2,
               '2024-01-05'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00004',
               'M-00001',
               '��ǰ��4',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               2,
               '2024-01-05'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00005',
               'M-00001',
               '��ǰ��5',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               3,
               '2024-01-05'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00006',
               'M-00002',
               '��ǰ��6',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               3,
               '2024-05-12'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00007',
               'M-00002',
               '��ǰ��7',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               4,
               '2024-05-12'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00008',
               'M-00002',
               '��ǰ��8',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               4,
               '2024-05-12'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00009',
               'M-00002',
               '��ǰ��9',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               5,
               '2024-05-12'
);

INSERT INTO review VALUES (
               review_seq.NEXTVAL,
               'G-00010',
               'M-00002',
               '��ǰ��10',
               '��ǰ���Դϴ�. �ּ� 30�� �̻� �ۼ����ּ���.',
               5,
               '2024-05-12'
);

CREATE SEQUENCE likes_seq;

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00001',
               'M-00001'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00002',
               'M-00001'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00003',
               'M-00001'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00004',
               'M-00001'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00005',
               'M-00001'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00006',
               'M-00002'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00007',
               'M-00002'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00008',
               'M-00002'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00009',
               'M-00002'
);

INSERT INTO likes VALUES (
               likes_seq.NEXTVAL,
               'G-00010',
               'M-00002'
);


-- ���̺� ��ȸ
SELECT
               *
FROM
               member
ORDER BY
               1;

SELECT
               *
FROM
               goods
ORDER BY
               1;

SELECT
               *
FROM
               cart
ORDER BY
               1;

SELECT
               *
FROM
               detail
ORDER BY
               1;

SELECT
               *
FROM
               orders
ORDER BY
               1;

SELECT
               *
FROM
               review
ORDER BY
               1;

SELECT
               *
FROM
               likes
ORDER BY
               1;

COMMIT;

SELECT
               d.goods_code,
               COUNT(d.goods_code) count,
               g.goods_name,
               g.price,
               g.thumb_image
FROM
               detail d,
               goods  g
WHERE
                              d.goods_code = g.goods_code
               AND category = '����'
GROUP BY
               d.goods_code,
               g.goods_name,
               g.price,
               g.thumb_image
ORDER BY
               2 DESC;

SELECT CASE category when '��Ŷ/ũ��Ŀ' then '��Ŷ' when '��Ű/����' then '��Ű' when '�����/�������' then '�����' else category end as category from goods;

SELECT b.*, CASE category when '��Ŷ/ũ��Ŀ' then '��Ŷ' when '��Ű/����' then '��Ű' when '�����/�������' then '�����' else category end as category
FROM
               (
                              SELECT
                                             ROWNUM rn,
                                             a.*
                              FROM
                                             (
                                                            SELECT
                                                                           d.goods_code,
                                                                           COUNT(d.goods_code) count,
                                                                           g.goods_name,
                                                                           g.price,
                                                                           g.thumb_image,
                                                                           g.category
                                                            FROM
                                                                           detail d,
                                                                           goods  g
                                                            WHERE
                                                                           d.goods_code = g.goods_code
                                                            GROUP BY
                                                                           d.goods_code,
                                                                           g.goods_name,
                                                                           g.price,
                                                                           g.thumb_image,
                                                                           g.category
                                                            ORDER BY
                                                                           2 DESC
                                             ) a
               ) b
WHERE
               b.rn <= 16;

SELECT goods_code, count, goods_name, price, thumb_image, CASE category when '��Ŷ/ũ��Ŀ' then '��Ŷ' when '��Ű/����' then '��Ű' when '�����/�������' then '�����' else category end as category FROM ( SELECT ROWNUM rn, a.* FROM ( select d.goods_code, count(d.goods_code) count, g.goods_name, g.price, g.thumb_image, g.category from detail d, goods g where d.goods_code = g.goods_code group by d.goods_code, g.goods_name, g.price, g.thumb_image, g.category order by 2 desc ) a ) b WHERE b.rn <= 16;
