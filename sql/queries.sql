-- =========================================================
-- Retail Commerce Database Management System
-- Sample SQL Queries
-- =========================================================


-- 1. Display customer order history
SELECT
    C.First_Name,
    C.Last_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount
FROM Customer C
JOIN Orders O
    ON C.Customer_ID = O.Customer_ID;


-- 2. Display the inventory status of products
SELECT
    P.Product_Name,
    S.SKU_ID,
    S.Size,
    S.Color,
    I.Quantity_On_Hand
FROM Product P
JOIN SKU S
    ON P.Product_ID = S.Product_ID
JOIN Inventory I
    ON S.SKU_ID = I.SKU_ID;


-- 3. Calculate the rate of product availability
SELECT
    AVG(
        CASE
            WHEN Quantity_On_Hand > 0 THEN 1.0
            ELSE 0.0
        END
    ) AS Availability_Rate
FROM Inventory;


-- 4. Display the most recent customer order
SELECT TOP (1)
    C.Customer_ID,
    C.First_Name,
    C.Last_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount
FROM Customer C
JOIN Orders O
    ON C.Customer_ID = O.Customer_ID
ORDER BY O.Order_Date DESC;
