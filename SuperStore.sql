create database project;
use project;

select * from orders limit 5;
select * from people;
select * from returns limit 5;

#Cleaning
#Remove rows with NULL OrderID, CustomerID, Sales, Profit
DELETE FROM Orders
WHERE `Order ID` IS NULL 
   OR `Customer ID` IS NULL 
   OR `Sales` IS NULL 
   OR `Profit` IS NULL;

#Fill missing discounts with 0
UPDATE Orders
SET Discount = 0
WHERE Discount IS NULL;

#Returns Flag
ALTER TABLE orders ADD COLUMN ReturnedFlag VARCHAR(3);

UPDATE orders o
LEFT JOIN Returns r ON o.`Order ID` = r.`Order ID`
SET o.ReturnedFlag = CASE 
                        WHEN r.`Order ID` IS NOT NULL THEN 'Yes'
                        ELSE 'No'
                     END;
                     




