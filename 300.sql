/*
3. Написать SQL запросы к приведенным таблицам



     DEPARTMENT

     ==========

     ID   integer   PRIMARY KEY

     NAME vchar



     EMPLOYEE

     ========

     ID   integer   PRIMARY KEY

     DEPARTMENT_ID  integer   REFERENCES DEPARTMENT(ID)

     CHIEF_ID  integer   REFERENCES EMPLOYEE(ID)

     NAME vchar

     SALARY    numeric

 */

     -- A. Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя

SELECT E.*
FROM   employee E,
       employee CHIEF
WHERE  CHIEF.id = E.chief_id
       AND E.salary > CHIEF.salary

     -- B. Вывести список сотрудников, получающих максимальную заработную плату в своем отделе

SELECT e1.*
FROM   employee e1
WHERE  e1.salary = (SELECT Max(e2.salary)
                    FROM   employee e2
                    WHERE  e2.department_id = e1.department_id)


     --C. Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек

SELECT department_id
FROM   employee
GROUP  BY department_id
HAVING( Count(*) <= 3 )


     --D. Вывести список сотрудников, не имеющих назначенного непосредственного руководителя, работающего в том-же отделе
SELECT e.*
FROM   employee e
       LEFT JOIN employee ch
              ON ( ch. id = e. chief_id
                   AND ch. department_id = e. department_id )
WHERE  ch. id IS NULL l


     -- E. Вывести список ID отделов с максимальной суммарной зарплатой сотрудников

WITH t
     AS (SELECT department_id,
                Sum(salary) salary
         FROM   employee
         GROUP  BY department_id)
SELECT department_id
FROM   t
WHERE  salary = (SELECT Max(salary)
                 FROM   t)