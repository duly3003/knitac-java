-- �׽�Ʈ�� ���̺� �����

create table dept_temp
as select * from dept;

select table_name from user_tables;

-- �ű� ������ ����
select * from dept_temp;

insert into dept_temp (deptno, dname, loc)
values (50, 'DEVELOPMENT', 'LA');

select * from dept_temp;

insert into dept_temp -- ��� �÷��� �����͸� �����ϴ� ��� �÷� ��� ���� ����
values (60, 'MARKETING', 'SEATLE');

select * from dept_temp;

insert into dept_temp (deptno, dname)
values (70, 'MANUFACTURING');

select * from dept_temp;

-- rollback; -- ������ commit �Ǵ� rollback ������ ��� �۾��� ����ϴ� ���
commit; -- ������ commit �Ǵ� rollback ������ ��� �۾��� Ȯ���ϴ� ���

select * from dept_temp;

-- �ű� ������ ���� 2
select * from emp;

insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9901, 'JOHN', 'CLERK', 7839, '2022-04-22', 790, NULL, 20);

select * from emp order by empno desc;

insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9902, 'JANE', 'ANALYST', 7839, SYSDATE, 1100, NULL, 20);

select * from emp order by empno desc;

commit; -- ���� �۾� Ȯ��

-- ���� ������ ����

update emp
set sal = 10000;

select * from emp;

rollback;

-- ������ ���� 
select * from dept_temp;
update dept_temp
set loc = 'ULSAN'
where deptno = 70;

select * from dept_temp;

-- ������ ����
update dept_temp
set dname = 'CRM', loc = 'SEOUL'
where deptno = 60;

select * from dept_temp;

commit; -- �۾� Ȯ��





