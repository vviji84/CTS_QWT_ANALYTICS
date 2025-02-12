{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
with recursive managers 
      ( indent, empid, emptitle,empname, Managerid,managertitle,managername,office) 
    as
      (
     select  '*' as indent , empid  ,  title as emptitle, lastname||' ' || firstname as empname,
        empid as Managerid ,  title as managertitle,lastname||' ' || firstname as managername,office
        from {{ref('stg_employees')}} as a
         where  title = 'President'
          union all 
        select indent || ' *' as indent, e.empid  ,  title as emptitle, lastname||' ' ||firstname as empname,
        reportsto as Managerid ,  emptitle as managertitle, empname as managername,e.office
          from {{ref('stg_employees')}} as e  join managers as m
            on e.reportsto = m.empid
            ),            
     offices as (
     select officeid, city,country
     from {{ref('stg_offices')}}
     )       
 
  select indent, empid,empname, emptitle,Managerid, managername,managertitle,
  officeid,city,country   from managers m
  join offices o on office=officeid


  -------old qry

  /*select
 
emp.empid,
emp.firstname,
emp.lastname,
emp.title,
emp.hiredate,
IFF(emp.extension = '-', 'NA', emp.extension) as extension,
emp.yearsalary,
IFF(mgr.firstname is null, emp.firstname, mgr.firstname) as managername,
IFF(mgr.title is null, emp.title, mgr.title) as managertitle,
ofc.address,
ofc.city,
ofc.country
 
from
 
{{ref('stg_employees')}} as emp left join
 
{{ref('stg_employees')}} as mgr on emp.reportsto = mgr.empid
 
left join {{ref('stg_offices')}} as ofc on emp.office = ofc.officeid */
