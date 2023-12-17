SELECT *
FROM history;

DROP TABLE history;

-- ���� ���̺�
CREATE TABLE history (
               history_number                NUMBER,
               history_date                  VARCHAR2 (100),
               product_code                  VARCHAR2 (100), 
               product_count                 NUMBER,
               sale_income                   NUMBER,
               sale_sort                     VARCHAR2 (100),
               history_sort                  VARCHAR2 (100));
               
-- �԰�
INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (1, '2023-12-15', 'F-001', 10, '�԰�');

INSERT INTO history(history_number, history_date, product_code, product_count, history_sort)
VALUES (2, '2023-12-15', 'F-002', 20, '�԰�');

-- �Ǹ�
INSERT INTO history
VALUES (3, '2023-12-15', 'F-001', 5, 10000, '����', '�Ǹ�');

INSERT INTO history
VALUES (4, '2023-12-16', 'F-002', 5, 10000, 'ī��', '�Ǹ�');
