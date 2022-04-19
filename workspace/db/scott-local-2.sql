-- ���̺� ��� ��ȸ
select table_name from user_tables;

-- ���̺� ���� ����
desc emp;
desc dept;
desc salgrade;
desc bonus;

-- EMP ���̺��� ��� �÷��� ������ ��ȸ 1
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

-- EMP ���̺��� ��� �÷��� ������ ��ȸ 2
select *
from emp;

-- emp ���̺��� empno, ename, deptno �÷��� ������ ��ȸ
select empno, ename, deptno
from emp;

-- emp ���̺��� ��ȸ�� ���� � �μ��� �ִ��� Ȯ��
select distinct deptno -- distinct : �ߺ� ����
from emp;

-- emp ���̺��� ename, ����, comm �÷� ��ȸ 1
select ename, sal * 12 + comm, comm
from emp;

-- emp ���̺��� ename, ����, comm �÷� ��ȸ 2
-- .... nvl(�÷�, �⺻��) : �÷��� ���� null�̸� �⺻�� ���
select ename, sal * 12 + nvl(comm, 0), comm
from emp;

-- emp ���̺��� ename, ����, comm �÷� ��ȸ 3
-- ... as : ��Ī�� ���� �� ��� (��������)
select ename, sal * 12 + nvl(comm, 0) as annsal, comm
from emp;

-- emp ���̺��� ename�� sal �÷��� sal ������ ��ȸ
select ename, sal
from emp
order by sal asc;

-- emp ���̺��� ename�� sal �÷��� sal ������ ��ȸ 2
select ename, sal
from emp
order by sal desc;

-- emp ���̺��� ename�� sal�� deptno �÷��� �μ��� sal ������ ��ȸ
select ename, sal, deptno
from emp
order by deptno asc, sal desc;

-- emp ���̺��� �μ��� 30�� ���� ��ȸ
select *
from emp
where deptno = 30;

-- emp ���̺��� �μ��� 30�̸鼭 job�� salesman�� ���� ��ȸ
select *
from emp
where deptno = 30 AND job = 'SALESMAN';

-- emp ���̺��� �޿��� 3000 �̻��� ���� ��ȸ
select *
from emp
-- where sal >= 3000; -- >, <, >=, <=, =, <> 
-- where sal = 3000;
where sal <> 3000;

-- emp ���̺��� job�� 'SALESMAN', 'MANAGER', 'CLERK' �� ���� ��ȸ 1
select *
from emp
-- where job = 'SALESMAN' OR job = 'MANAGER' OR job = 'CLERK';
where job != 'SALESMAN' AND job != 'MANAGER' AND job != 'CLERK';

-- emp ���̺��� job�� 'SALESMAN', 'MANAGER', 'CLERK' �� ���� ��ȸ
select *
from emp
-- where job IN ('SALESMAN', 'MANAGER', 'CLERK');
where job NOT IN ('SALESMAN', 'MANAGER', 'CLERK'); -- NOT -> !

-- emp ���̺��� �޿��� 2000 ~ 3000�� ���� ��ȸ 1
select *
from emp
where sal >= 2000 AND sal <= 3000;

-- emp ���̺��� �޿��� 2000 ~ 3000�� ���� ��ȸ 2
select *
from emp
where sal BETWEEN 2000 AND 3000;

-- emp ���̺��� �޿��� 2000 ���� �۰ų� 3000���� ū ���� ��ȸ
select *
from emp
where sal NOT BETWEEN 2000 AND 3000;

-- �̸��� S�� �����ϴ� ���� ��ȸ
select *
from emp
where ename like 'S%'; -- '%' : 0�� �̻��� ����, _ : 1���� ����

-- �̸��� 'AM'�� ���Ե��� ���� ���� ��ȸ
select *
from emp
where ename not like '%AM%';

-- job�� SALESMAN�� �ƴ� ���� ��ȸ ( COMM �÷� ����ؼ� ���� ���� )
select *
from emp
-- where comm = null; -- null�� �����ڷ� ���� �� ���� ��
-- where comm is null; -- null�� ���� ��� is null ���
where comm is not null;

-- �μ��� 10 �Ǵ� 20�� ���� ��ȸ
select *
from emp
where deptno in (10, 20);

select *
from emp
where deptno = 10
union -- �� ��ȸ ����� ����
select *
from emp
where deptno = 20;

select *
from emp
minus -- ���� ��ȸ ������� ���� ��ȸ ����� �� ������ ��ȸ
select *
from emp
where deptno = 30;

-- deptno�� 20�� ����
select *
from emp
where deptno in (20, 30)
intersect -- �� ��ȸ����� ������ ����� ��ȸ
select *
from emp
where deptno in (10, 20);




