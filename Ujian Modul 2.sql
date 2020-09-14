

-- Soal I.1
SELECT COUNT(customerName) as Customers , COUNT(DISTINCT(city)) as Cities, COUNT(DISTINCT(country)) as Countries from customers;

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
select * from products;
select * from orders;
select * from orderdetails;
select * from productlines;
select * from payments;
select sum(quantityInStock) from products ;

-- Soal I.2-- 
SELECT 
	COUNT(e.employeeNumber) as Employees,
	count(o.officeCode) as Offices, 
	count(distinct(o.country)) as Countries,
	count(p.productCode) as Products, 
	count(p.quantityInstock) as TotalQuantityInStock,
	count(distinct(p.productVendor)) as Vendor
 from employees e
 join offices o on o.officeCode=e.officeCode
 join products p on p.productCode=od.productCode;
 
 -- Soal I.3--
select o.city, count(distinct(e.employeeNumber)) as totalEmployee
 from employees e
 join offices o on o.officeCode=e.officeCode group by city
 order by totalEmployee desc;
 
-- soal I.4--
select pl.productLine, sum(p.quantityInStock), min(p.buyPrice) as minPrice, max(p.buyPrice) as maxPrice 
from products p join productlines pl on p.productLine=pl.productLine group by pl.productLine;

-- soal I.5--
SELECT 
	c.customerName, 
	c.city, 
    c.country,
    sum((od.quantityOrdered*od.priceEach)) as totalSpending
from customers c 
join orders o on c.customerNumber = o.customerNumber
join orderdetails od on o.orderNumber=od.orderNumber
group by c.customerName, c.city, c.country
order by totalSpending desc
limit 10;


