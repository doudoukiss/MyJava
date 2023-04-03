CREATE TABLE dept(
                     deptno MEDIUMINT   UNSIGNED  NOT NULL  DEFAULT 0,
                     dname VARCHAR(20)  NOT NULL  DEFAULT "",
                     loc VARCHAR(13) NOT NULL DEFAULT ""
);

INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK'),
                       (20, 'RESEARCH', 'DALLAS'),
                       (30, 'SALES', 'CHICAGO'),
                       (40, 'OPERATIONS', 'BOSTON');

SELECT * FROM dept;



CREATE TABLE emp
(empno  MEDIUMINT UNSIGNED  NOT NULL  DEFAULT 0,
 ename VARCHAR(20) NOT NULL DEFAULT "",
 job VARCHAR(9) NOT NULL DEFAULT "",
 mgr MEDIUMINT UNSIGNED ,
 hiredate DATE NOT NULL,
 sal DECIMAL(7,2)  NOT NULL,
 comm DECIMAL(7,2) ,
 deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0
);

INSERT INTO emp VALUES(7369, 'SMITH', 'CLERK', 7902, '1990-12-17', 800.00,NULL , 20),
                      (7499, 'ALLEN', 'SALESMAN', 7698, '1991-2-20', 1600.00, 300.00, 30),
                      (7521, 'WARD', 'SALESMAN', 7698, '1991-2-22', 1250.00, 500.00, 30),
                      (7566, 'JONES', 'MANAGER', 7839, '1991-4-2', 2975.00,NULL,20),
                      (7654, 'MARTIN', 'SALESMAN', 7698, '1991-9-28',1250.00,1400.00,30),
                      (7698, 'BLAKE','MANAGER', 7839,'1991-5-1', 2850.00,NULL,30),
                      (7782, 'CLARK','MANAGER', 7839, '1991-6-9',2450.00,NULL,10),
                      (7788, 'SCOTT','ANALYST',7566, '1997-4-19',3000.00,NULL,20),
                      (7839, 'KING','PRESIDENT',NULL,'1991-11-17',5000.00,NULL,10),
                      (7844, 'TURNER', 'SALESMAN',7698, '1991-9-8', 1500.00, NULL,30),
                      (7900, 'JAMES','CLERK',7698, '1991-12-3',950.00,NULL,30),
                      (7902, 'FORD', 'ANALYST',7566,'1991-12-3',3000.00, NULL,20),
                      (7934,'MILLER','CLERK',7782,'1992-1-23', 1300.00, NULL,10);

SELECT * FROM emp;


#工资级别表
CREATE TABLE salgrade
(
    grade MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
    losal DECIMAL(17,2)  NOT NULL,
    hisal DECIMAL(17,2)  NOT NULL
);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);

SELECT * FROM salgrade;
SELECT * FROM dept;
SELECT * FROM emp;

# 演示group by + having
GROUP by用于对查询的结果分组统计, (示意图)

SELECT AVG(sal), MAX(sal) , deptno
FROM  emp GROUP BY deptno;
SELECT FORMAT(AVG(sal),2), MAX(sal) , deptno
FROM  emp GROUP BY deptno;

SELECT AVG(sal), MIN(sal) , deptno, job
FROM  emp GROUP BY deptno, job;

SELECT AVG(sal), deptno
FROM emp GROUP BY deptno
HAVING AVG(sal) < 2000;

SELECT AVG(sal) AS avg_sal, deptno
FROM emp GROUP BY deptno
HAVING avg_sal < 2000;






