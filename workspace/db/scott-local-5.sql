-- group by ����
select * from book;
select sum(price), count(price), avg(price) from book;

select publisher, count(price), avg(price) 
from book
group by publisher;

select * from orders;

-- ���� �ֹ� ���
select c.custid, c.name, count(saleprice), round( avg(saleprice), 2 )
from orders o, customer c
where o.custid = c.custid
group by c.custid, c.name;

-- subquery ����
-- ��� �ֹ� ���ݺ��� ���� �ֹ� ��ȸ
select avg(saleprice) from orders; -- 11800
select *
from orders
where saleprice > 11800; -- ���� ����� ����ؼ� ��ȸ

select *
from orders
where saleprice > ( select avg(saleprice) from orders );

-- �ֹ� ������ �ִ� �� ��ȸ
select *
from customer 
-- where custid IN ( select distinct custid from orders );
where custid NOT IN ( select distinct custid from orders ); -- �ֹ� ������ ���� ��

-- �޿��� ���� ���� ���� ��ȸ (EMP)
select * from emp where sal = ( select max(sal) from emp );

select rownum, empno, ename, sal -- rownum : ��ȸ�� �������� ������ȣ
from emp;

select rownum, empno, ename, sal -- rownum : ��ȸ�� �������� ������ȣ
from emp
order by sal desc;

select rownum, empno, ename, sal -- rownum : ��ȸ�� �������� ������ȣ
from
(
    select empno, ename, sal
    from emp
    order by sal desc
) a
where rownum = 1;

-- scalar �μ� ����
select 
    (select avg(saleprice) from orders) ����ǸŰ���,
    (select avg(price) from book) ��յ�������
from dual; -- dual : ������� ���̺��� ������ �� ���� ��� ����ϴ� �ӽ����̺�

select * from salgrade;
select empno, ename, sal,
       ( select grade 
         from salgrade 
         where e.sal between losal and hisal ) grade
from emp e;

-- /////////////////////////////////////////////////

-- (5) �������� ������ ������ ���ǻ� ��
select count(distinct publisher) ���ǻ��
from customer c, orders o, book b
where c.custid = o.custid and 
      o.bookid = b.bookid and
      c.name = '������';

select count(distinct publisher) ���ǻ��
from customer c
inner join orders o
on c.custid = o.custid
inner join book b
on o.bookid = b.bookid 
where c.name = '������';

-- (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select b.bookname ������, b.price ����, b.price - o.saleprice ���ξ�
from customer c, orders o, book b
where c.custid = o.custid and 
      o.bookid = b.bookid and
      c.name = '������';
      
-- (7) �������� �������� ���� ������ �̸�
select b.bookname
from book b
where b.bookid not in ( select o.bookid
                        from orders o, customer c
                        where o.custid = c.custid and
                              c.name = '������' );

-- (9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) "�ֹ� �Ѿ�", avg(saleprice) "�ֹ� ��վ�"
from orders;

-- (10) ���� �̸��� ���� ���ž�
select c.name, nvl(sum(o.saleprice), 0) "�ֹ��Ѿ�"
from customer c, orders o
where c.custid = o.custid(+)
group by c.name;

-- (11) ���� �̸��� ���� ������ ���� ���
select c.name, b.*
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

-- (12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select rownum, a.*
from 
(
    select o.*, b.price - o.saleprice discount
    from book b, orders o
    where b.bookid = o.bookid
    order by discount desc
) a
where rownum = 1;

select o.*, b.price
from book b, orders o
where b.bookid = o.bookid
      and
      (b.price - o.saleprice) = ( select max(b2.price - o2.saleprice)
                                  from book b2, orders o2
                                  where b2.bookid = o2.bookid );

-- (13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select c.custid, c.name, round(avg(o.saleprice), 2) "���ž� ���"
from customer c, orders o
where c.custid = o.custid
group by c.custid, c.name
having avg(o.saleprice) > ( select avg(saleprice) from orders );










