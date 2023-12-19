SELECT *
FROM product
ORDER BY 1;

DROP TABLE product;

-- 상품 테이블
CREATE TABLE product (
               product_code                  VARCHAR2 (100) PRIMARY KEY,
               product_name                  VARCHAR2 (100) NOT NULL,
               product_price                NUMBER NOT NULL,
               product_remain                NUMBER DEFAULT 0);

INSERT INTO product
VALUES ('P00001', '도시락', 5500, 10);
INSERT INTO product
VALUES ('P00002', '샌드위치', 3600, 9);
INSERT INTO product
VALUES ('P00003', '삼각김밥', 1300 ,9);
INSERT INTO product
VALUES ('P00004', '감자칩', 1700, 9);
INSERT INTO product
VALUES ('P00005', '크림빵', 2900, 8);
INSERT INTO product
VALUES ('P00006', '젤리', 1200, 5);
INSERT INTO product
VALUES ('P00007', '아이스크림', 2200, 9);
INSERT INTO product
VALUES ('P00008', '컵라면', 1800, 7);
INSERT INTO product
VALUES ('P00009', '구운계란', 2300, 9);
INSERT INTO product
VALUES ('P00010', '초코우유', 1400, 9);