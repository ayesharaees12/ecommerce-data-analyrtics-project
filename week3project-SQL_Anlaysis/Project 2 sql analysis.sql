SELECT * FROM orders;

SELECT Product,Quantity,UnitPrice,TotalPrice FROM orders
WHERE OrderStatus="Delivered"
ORDER BY TotalPrice DESC LIMIT 10;

SELECT OrderID,Product,CouponCode,TotalPrice FROM orders
WHERE CouponCode IS NOT NULL
   AND TotalPrice>2000
ORDER BY TotalPrice DESC;
-- GROUPBY
SELECT OrderStatus,
      COUNT(*) AS order_count
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;

-- REVENUE BY PRODUCT 
SELECT Product,
      COUNT(*) AS total_orders,
      SUM(TotalPrice) AS total_revenue,
      ROUND(AVG(TotalPrice),2) AS avg_order_value
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;

-- ORDERS BY PAYMENT METHOD
SELECT PaymentMethod,
     COUNT(*) AS total_orders,
     ROUND(SUM(TotalPrice),2) AS total_revenue
FROM orders
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;

-- AVERAGE ORDER VALUE by ReferralSource
SELECT ReferralSource,
	COUNT(*) AS total_orders,
    ROUND(SUM(TotalPrice),2) AS total_revenue,
    ROUND(AVG(TotalPrice),2) AS avg_order_value
FROM orders
GROUP BY ReferralSource
ORDER BY total_revenue DESC;

SELECT PaymentMethod,OrderStatus,
        COUNT(*) AS order_count
FROM orders
GROUP BY PaymentMethod,OrderStatus
ORDER BY PaymentMethod,order_count DESC;

-- HAVING
SELECT Product,
SUM(TotalPrice) AS revenue
FROM orders
GROUP BY Product
HAVING revenue>10000;

SELECT CouponCode,
	COUNT(*) AS usage_count,
    ROUND(AVG(TotalPrice),2) AS avg_total_value
FROM orders
WHERE CouponCode IS NOT NULL
GROUP BY CouponCode 
HAVING usage_count > 10
ORDER BY avg_total_value DESC;



-- Cancelled Orders
SELECT COUNT(*) FROM orders
WHERE OrderStatus="Cancelled";

-- Monthly Revenue
SELECT MONTH(DATE) AS MONTH,
SUM(TotalPrice) AS REVENUE
FROM orders
GROUP BY MONTH
ORDER BY MONTH;
    
      
     