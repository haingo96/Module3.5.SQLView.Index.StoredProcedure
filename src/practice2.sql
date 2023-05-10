use classicmodels;

DELIMITER //
CREATE PROCEDURE findNameCustomers()
BEGIN
    SELECT customerName FROM customers;
end //
DELIMITER;

DROP PROCEDURE findNameCustomers;

CALL findNameCustomers();

delimiter //
create procedure findCustomerByFirstName(name varchar(20))
begin
    select * from customers where contactFirstName = name;
end //
delimiter ;

call findCustomerByFirstName('Jean');

delimiter //
create procedure findCustomerByLastName(in lastName varchar(20), out foundCustomer varchar(20))
begin
    select contactLastName
    into foundCustomer
    from customers
    where contactLastName = lastName;
end //
delimiter ;

drop procedure findCustomerByLastName;

call findCustomerByLastName('Young', @foundCustomer);
select @foundCustomer;

DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8

