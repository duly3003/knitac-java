-- ���� ���� : SQL ���ο� �ٸ� SQL�� �ִ� ���

-- 1. JONES �������� �޿��� ���� ���� ��ȸ
select sal
from emp
where ename = 'JONES'; -- JONES ������ �޿��� 2975���� Ȯ��

select *
from emp
where sal > 2975; -- �� ��ȸ�� ����� �������� ���

select *
from emp
where sal > ( select sal
              from emp
              where ename = 'JONES' );
              
-- CLARK �������� �ʰ� �Ի��� ���� ��ȸ
select *
from emp
where hiredate > ( select hiredate
                   from emp
                   where ename = 'CLARK' );
                   
-- "NEW YORK" �Ǵ� "CHICAGO"���� �ٹ��ϴ� ���� ��ȸ
select deptno
from dept 
where loc = 'NEW YORK' or loc = 'CHICAGO';

select *
from emp
-- where deptno = 10 or deptno = 30;
-- where deptno in (10, 30);
where deptno in ( select deptno
                  from dept 
                  where loc = 'NEW YORK' or loc = 'CHICAGO' );
                  
-- ���� ��� �޿����� �޿��� ���� ���� ��ȸ
select emp.*, round((select avg(sal) from emp), 2) salavg
from emp
where sal > ( select avg(sal)
              from emp );
              
-- Book, Orders, Customer ���̺� ����ؼ� SQL �ۼ�
-- 1. ���� ��� ������ �̸��� ���̽ÿ�
select  *
from book
where price = ( select max(price) from book );
-- 2. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select distinct custid from orders; -- �ֹ��� �� ���̵�
select name
from customer
where custid in ( select distinct custid 
                  from orders );
                  
select distinct c.name
from customer c, orders o
where c.custid = o.custid;

-- 3. ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�
select name
from customer
where custid in ( select distinct custid
                  from orders 
                  where bookid in ( select bookid
                                    from book 
                                    where publisher = '���ѹ̵��' ) );

select c.name
from customer c, orders o, book b
where c.custid = o.custid and 
      o.bookid = b.bookid and 
      b.publisher = '���ѹ̵��';
      
-- 4. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
select b1.*
from book b1 -- b1.publisher = '�̻�̵��'
where b1.price > ( select avg(b2.price)
                   from book b2
                   where b2.publisher = b1.publisher
                   group by b2.publisher );
                   
select b2.publisher, avg(b2.price)
from book b2
-- where b2.publisher = '���ѹ̵��'
group by b2.publisher;
                   
-- 
                   
                   
                   