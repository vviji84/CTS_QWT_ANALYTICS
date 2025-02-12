{{config(materialized = 'table')}}

select  
Office as officeid,
OfficeAddress as address,
OfficePostalCode as postalcode,
OfficeCity as city,
OfficeStateProvince as stateprovince,
OfficePhone as phone,
OfficeFax as fax,
OfficeCountry as country
from 
 {{source('raw_qwt','raw_offices')}}