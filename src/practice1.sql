use classicmodels;

SELECT * FROM customers;
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'King';

CREATE INDEX customerName_index ON customers(customerName);
ALTER TABLE customers ADD INDEX customers_index2(customerName);
DROP INDEX customerName_index ON customers;
ALTER TABLE customers ADD INDEX fullName_index(contactFirstName, contactLastName);