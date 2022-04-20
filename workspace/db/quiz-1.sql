desc emp;
select * from emp;
select *
from emp
where hiredate = '1980-12-17'; -- ��¥�� ǥ���� �� '���

-- (1) ������ȣ�� 1�� ������ �̸� ( book table)
select * from book;
select bookname
from book
where bookid = 1;

-- (2) ������ 20,000�� �̻��� ������ �̸�
select bookname
from book
where price >= 20000;

-- (3) �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
--     sum : �������� �հ踦 ����ϴ� �����Լ� 
select custid from customer where name = '������';
select sum(saleprice) ���ž�
from orders
where custid = 1;

-- (4) �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
--     count : �������� ����(���� ����)�� �˷��ִ� �����Լ�
select count( bookid ) ������
from orders
where custid = 1;

-- (1) ���缭�� ������ �� ����
select count(*) ��������
from book;

-- (2)���缭���� ������ ����ϴ� ���ǻ��� �� ����
-- select distinct publisher
select count(distinct publisher) ���ǻ簳��
from book;

-- (3)��� ���� �̸�, �ּ�
desc customer;
select name, address
from customer;

-- (4)2020�� 7�� 4��~7�� 7�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select *
from orders
where orderdate between '2020-7-4' and '2020-7-7' ;

-- (5) 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select *
from orders
where orderdate not between '2020-7-4' and '2020-7-7' ;

select *
from orders
minus
select *
from orders
where orderdate between '2020-7-4' and '2020-7-7' ;

-- (6) ���� ���衯 ���� ���� �̸��� �ּ�
select *
from customer
where name like '��%';

-- (7) ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
select *
from customer
where name like '��%��';






