use classicmodels;

create or replace view customer_view as
select customerNumber, customerName
from customers where customerNumber < 250;

select *
from customer_view;

insert into customer_view (customerNumber, customerName)
value (1,'hahaha');