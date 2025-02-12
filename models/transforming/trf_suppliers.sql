{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
 
GET(XMLGET(SuppliersInfo, 'SupplierID'), '$') as SupplierID,
GET(XMLGET(SuppliersInfo, 'CompanyName'), '$')::varchar as CompanyName,
GET(XMLGET(SuppliersInfo, 'ContactName'), '$')::varchar as ContactName,
GET(XMLGET(SuppliersInfo, 'Address'), '$')::varchar as Address,
GET(XMLGET(SuppliersInfo, 'City'), '$')::varchar as City,
GET(XMLGET(SuppliersInfo, 'PostalCode'), '$')::varchar as PostalCode,
GET(XMLGET(SuppliersInfo, 'Country'), '$')::varchar as Country,
GET(XMLGET(SuppliersInfo, 'Phone'), '$')::varchar as Phone,
GET(XMLGET(SuppliersInfo, 'Fax'), '$')::varchar as Fax
 
from
 
{{ref('stg_suppliers')}}