/*{{config(materialized = 'table' , pre_hook = "use warehouse loading_wh;",
           post_hook = 'grant select on table qwt_analytics_dev.staging_dev.stg_customers to role public;')}} */

{{config(materialized = 'table')}}


select * from {{source('raw_qwt','raw_Customers')}}