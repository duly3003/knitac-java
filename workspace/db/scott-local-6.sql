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