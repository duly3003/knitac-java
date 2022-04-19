-- ���̺� ��� ��ȸ
select table_name from user_tables;

-- ���̺� ���� ����
desc employees;
desc departments;
desc jobs;

-- 1. employees ���̺��� ��� �÷� ��ȸ
select * 
from employees;

-- 2. employees ���̺��� employee_id, first_name, last_name, 
--                        hire_date, salary �÷� ��ȸ
select employee_id, first_name, last_name, hire_date, salary
from employees;
-- ����Ŭ���� ���ڿ� ����(+)�� || ������ ���
-- ����Ŭ���� ���ڿ��� ��������ǥ�� ����ؼ� ǥ��
select employee_id, first_name || ' ' || last_name name, hire_date, salary
from employees;

-- 3. employees ���̺��� ��� �÷��� hire_date ������ �����ؼ� ��ȸ
select *
from employees
order by hire_date desc;
-- 3. employees ���̺��� ��� �÷��� salary ������ �����ؼ� ��ȸ
select *
from employees
order by salary desc;
-- 4. employees ���̺��� employee_id, first_name, last_name, 
--                        annsal (salary * 12) ��ȸ
select employee_id, first_name, last_name, salary * 12 as annsal
from employees;
