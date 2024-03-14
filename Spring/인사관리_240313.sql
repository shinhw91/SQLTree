select * from (select rownum as rn, a.* from (

                    select *
                    from employees
                    order by hire_date
                    
) a where rownum <=15) b where rn > 10;

--page      start               end
--1         (i-1) * 5+1        1 * 5
--2             

select e.department_id "id", d.department_name "name", count(*) "cnt"
from employees e JOIN departments d
ON e.department_id = d.department_id
where e.department_id is not null
group by e.department_id, d.department_name;