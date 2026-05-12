-- Display customer order history
SELECT 
    C.First_Name,
    C.Last_Name,
    O.Order_ID,
    O.Order_Date,
    O.Total_Amount
FROM Customer C
JOIN Orders O
    ON C.Customer_ID = O.Customer_ID;

-- Display inventory status of products
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

-- Calculate product availability rate
SELECT 
    AVG(CASE WHEN Quantity_On_Hand > 0 THEN 1.0 ELSE 0.0 END) AS Availability_Rate
FROM Inventory;

-- Display most recent customer order
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
