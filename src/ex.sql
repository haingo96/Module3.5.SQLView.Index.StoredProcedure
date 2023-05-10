create database unit5_ex_demo;

use unit5_ex_demo;

create table product(
    id int auto_increment primary key ,
    productCode int ,
    productName varchar(20) ,
    productPrice float,
    productAmount int,
    productDescription longtext,
    productStatus bit
);

insert into product values (null, 1, 'A', 2.5, 4, null, 0);
insert into product values (null, 3, 'D', 1.5, 3, null, 1);
insert into product values (null, 5, 'G', 3.5, 6, null, 1);
insert into product values (null, 6, 'H', 9.5, 1, null, 0);
insert into product values (null, 8, 'E', 4.5, 4, null, 1);
insert into product values (null, 9, 'Y', 1.5, 7, null, 0);

explain select *from product where productName = 'a';

create unique index productCode_unique_index
on product(productCode);

drop index productCode_unique_index on product;

alter table product
add index productName_price_index(productName, productPrice);

drop index productCode_unique_index on product;


create view product_view as
    select productCode, productName, productPrice, productStatus
from product;

select * from product_view;

update product_view
set productPrice = 3 where productStatus = 1;

insert into product_view values (10, 'S', 5, 0);

drop view product_view;




delimiter //
create procedure getAllProduct()
begin
    select * from product;
end //
delimiter ;

delimiter //
create procedure addProduct(productC int, productN varchar(20))
    begin
        insert into product (productCode, productName)
            values (productC, productN);
    end //
delimiter ;

delimiter //
create procedure editProduct(productId int, productC int, productN varchar(20))
    begin
        update product
            set productCode = productC, productName = ProductN
        where id = productId;
    end //
delimiter ;

delimiter //
create procedure removeProduct(productId int)
    begin
        delete from product where id = productId;
    end //
delimiter ;

call getAllProduct();
call addProduct(11, 'R');
call editProduct(1, 12, 'A');
call removeProduct(2);

