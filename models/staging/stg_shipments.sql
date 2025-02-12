{{config(materialized = 'table')}}

select  

OrderID,
LineNo ,
ShipperID,
CustomerID,
ProductID,
EmployeeID,
cast(left(shipmentdate,length(shipmentdate) -5) as date) as ShipmentDate,Status

from 
 {{source('raw_qwt','raw_shipments')}}