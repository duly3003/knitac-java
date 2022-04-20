-- ���� �Լ� : AVG, SUM, COUNT, MIN, MAX
select sal from emp;
select 
    sum(sal) �ѱ޿�
    , count(sal) ������
    , round( avg(sal), 2 ) ��ձ޿�
    , min(sal) �ּұ޿�
    , max(sal) �ִ�޿�
from emp;

-- �μ��� �ѱ޿�, ������, ��ձ޿�, �ּұ޿�, �ִ�޿�
select 
    deptno �μ�
    -- , ename �̸� -- group by �� ��õ� �÷��� ��ȸ ����
    , sum(sal) �ѱ޿�
    , count(sal) ������
    , round( avg(sal), 2 ) ��ձ޿�
    , min(sal) �ּұ޿�
    , max(sal) �ִ�޿�
from emp
group by deptno
order by deptno;

-- ��ձ޿��� 2000 �̻��� �μ� ��ȸ
select 
    deptno �μ�
    -- , ename �̸� -- group by �� ��õ� �÷��� ��ȸ ����
    , sum(sal) �ѱ޿�
    , count(sal) ������
    , round( avg(sal), 2 ) ��ձ޿�
    , min(sal) �ּұ޿�
    , max(sal) �ִ�޿�
from emp
-- where avg(sal) > 2000
group by deptno
having avg(sal) > 2000; -- group by ���Ŀ� �����ϴ� ���ǰ˻�

-- �������� ��ȸ
select * from emp; -- �μ� ��ȣ�� �μ� �̸� ������ �����ϴ�.
select * from dept; -- �μ� �̸� ������ dept ���̺� �ֽ��ϴ�.

-- 1. �������� ��ȸ (�μ� �̸��� �Բ� ��ȸ) - join
-- 1-1.
select *
from emp, dept; -- �� ���̺��� �����ͷ� ���� ������ ��� ������ ��ȸ

-- 1-2. �μ���ȣ�� ��ġ�ϴ� �����͸� ��ȸ
select *
from emp, dept
where emp.deptno = dept.deptno;

-- 1-3. �÷��� ��� (���̺� �̸� ���� ǥ��)
-- select empno, ename, job, dept.deptno, dname
select emp.empno, emp.ename, emp.job, dept.deptno, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

-- 1-4. ���̺� �̸� ��Ī ���
select e.empno, e.ename, e.job, d.deptno, d.dname
from emp e, dept d -- sql������ e�� emp�� d�� dept�� �ǹ��ϴ� ����
where e.deptno = d.deptno
order by e.deptno;

-- 1-5. ǥ�� Join ����
select e.empno, e.ename, e.job, d.deptno, d.dname
from emp e
inner join dept d
on e.deptno = d.deptno -- join�� ���� ���� (where)
order by e.deptno;

-- 2-1. �μ��ڵ�, �μ���, �����̸� ��ȸ
select d.deptno, d.dname, e.ename
from dept d
inner join emp e
on e.deptno = d.deptno -- join�� ���� ���� (where)
order by d.deptno, e.ename;

-- 2-1�� ���� ��Ȳ Ȯ��
select * from dept; -- 40�� �μ��� ���� ������ ��ȸ���� ���� ���� Ȯ��

-- 2-2. �μ��ڵ�, �μ���, �����̸� ��ȸ
select d.deptno, d.dname, e.ename
from dept d
left outer join emp e -- outer join : ������ ���̺��� �����ʹ� ��� ��ȸ
on e.deptno = d.deptno -- join�� ���� ���� (where)
order by d.deptno, e.ename;

-- ����Ŭ�� outer join
select d.deptno, d.dname, e.ename
from dept d, emp e
where d.deptno = e.deptno(+)
order by d.deptno, e.ename;

-- 3-1. empno, empname, job, mgr, mgr�� ename ��ȸ
select * from emp;

select e1.empno, e1.ename, e1.job, e1.mgr, e2.ename mgrname
from emp e1, emp e2
where e1.mgr = e2.empno(+);

select e1.empno, e1.ename, e1.job, e1.mgr, e2.ename mgrname
from emp e1
left outer join emp e2
on e1.mgr = e2.empno;




