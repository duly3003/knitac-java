-- ���̺� ����� 1
create table my_emp
(
--  �÷��̸�    �ڷ���                 NULL?       DEFAULT
    empno      number(4, 0)          NOT NULL,
    ename      varchar2(20 BYTE)     NOT NULL,
    job        varchar2(20 CHAR)     NULL,
    mgr        number(4, 0)          NULL,
    hiredate   date                               DEFAULT (SYSDATE),
    sal        number(7, 2)          NULL,
    comm       number(7, 2)          NULL,
    deptno     number(2,0)           NOT NULL
);
desc my_emp;

-- ���̺� ����
drop table my_emp;

-- ���̺� ����� 2
create table my_emp
(
--  �÷��̸�    �ڷ���                 NULL?       DEFAULT
    empno      number(4, 0)          NOT NULL,
    ename      varchar2(20 BYTE)     NOT NULL,
    job        varchar2(20 CHAR)     NULL,
    mgr        number(4, 0)          NULL,
    hiredate   date                               DEFAULT (SYSDATE),
    sal        number(7, 2)          NULL,
    comm       number(7, 2)          NULL,
    deptno     number(2,0)           NOT NULL,
    -- primary key (empno), -- �⺻Ű ����
    constraint pk_my_emp primary key (empno), -- �⺻Ű ����
    -- foreign key (deptno) references dept(deptno) -- �ܷ�Ű ����
    constraint fk_dept_my_emp foreign key (deptno) references dept(deptno) -- �ܷ�Ű ����
);
desc my_emp;

-- ���̺� ����
drop table my_emp;

-- ���̺� ����

select * from my_emp;

-- �÷� �߰�
alter table my_emp
add mobile varchar2(15) null;
-- �÷� �̸� ����
alter table my_emp
rename column mobile to phone;
-- �÷� �ڷ��� ����
alter table my_emp
modify empno number(6);
-- �÷� ����
alter table my_emp
drop column phone;

-- ���̺� �̸� ����
rename my_emp to emp2;

-- ���̺� ����� 1
-- �̸� : ȸ�� (Member)
-- �÷� : ȸ�����̵�(memberid), ��й�ȣ(passwd), �̸���(email), 
--       ����(active, char(1) ), ��������(regdate)
-- �������� : ȸ�����̵� : pk
--           ��й�ȣ : not null
--           ���� : �⺻�� '1', �������� : default ����
create table member
(
    memberid varchar2(20) primary key,
    passwd varchar2(100) not null,
    email varchar2(50) null,
    active char(1) default ('1'),
    regdate date default (sysdate)
);

-- ���̺� ����� 2
-- �̸� : �Խ��� (Board)
-- �÷� : �۹�ȣ(boardno), ����(title), �ۼ���(writer), ����(content),
--        �ۼ�����(writedate), ��������(modifydate), ��ȸ�� (readcount)
-- �������� : �۹�ȣ : pk / ����, �ۼ��� : not null
--           �ۼ�����, �������� : default ����, ��ȸ�� : default 0

create table board
(
    boardno number not null,
    title varchar2(100 char) not null,
    writer varchar2(20) not null,
    content varchar2(4000 char) null,
    writerdate date default(sysdate),
    modifydate date default(sysdate),
    readcount number(7) default (0),
    constraint pk_board primary key (boardno),
    constraint fk_board_member 
    foreign key (writer) references member(memberid)
);

-- �ڵ� ���� ��ȣ�� �����ϴ� ����
create sequence board_sequence nocache;

-- �ڵ� ���� ��ȣ ����⿡�� ��ȣ �̱� (���� ���� ��ȣ ����)
select board_sequence.nextval ������ȣ from dual;
-- �ڵ� ���� ��ȣ ����⿡�� ��ȣ �̱� (���� ���� ��ȣ ����) 
select board_sequence.currval ������ȣ from dual;

-- member ���̺�� board ���̺� ������ insert�ϴ� ���� �ۼ�
-- board ���̺� insert�� ������ sequence ���







