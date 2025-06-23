-- A. Các chỉ số hiệu suất chính (KPIs)
-- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

-- 2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_Order_Value 
FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales;

-- 5. Average Pizzas Per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS Avg_Pizzas_per_order
FROM pizza_sales;

-- Tạo CTE 
WITH SalesWithFormattedDate AS (
    SELECT
        order_id,
        quantity,
        total_price,
        pizza_category,
        pizza_size,
        pizza_name,
        STR_TO_DATE(order_date, '%d-%m-%Y') AS formatted_order_date
    FROM pizza_sales
    WHERE order_date IS NOT NULL
)

-- B. Xu hướng đặt hàng theo ngày trong tuần
SELECT
    DAYNAME(formatted_order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    SalesWithFormattedDate
GROUP BY order_day, DAYOFWEEK(formatted_order_date)
ORDER BY DAYOFWEEK(formatted_order_date);

-- Tạo CTE 
WITH SalesWithFormattedDate AS (
    SELECT
        order_id,
        quantity,
        total_price,
        pizza_category,
        pizza_size,
        pizza_name,
        STR_TO_DATE(order_date, '%d-%m-%Y') AS formatted_order_date
    FROM pizza_sales
    WHERE order_date IS NOT NULL
)
-- C. Xu hướng đặt hàng theo tháng
SELECT
    DATE_FORMAT(formatted_order_date, '%m-%Y') AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM SalesWithFormattedDate
GROUP BY order_month
ORDER BY order_month;

-- D. % of Sales by Pizza Category
SELECT 
    pizza_category, 
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct
FROM pizza_sales
GROUP BY pizza_category;

-- E. % of Sales by Pizza Size
SELECT 
    pizza_size, 
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- F. Tổng số Pizza đã bán theo Danh mục
SELECT
    pizza_category,
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;

-- G. Top 5 Pizza theo Doanh thu
SELECT
    pizza_name,
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- H. Bottom 5 Pizza theo Doanh thu
SELECT
    pizza_name,
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

-- I. Top 5 Pizza theo Số lượng bán
SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- J. Bottom 5 Pizza theo Số lượng bán
SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold ASC
LIMIT 5;

-- K. Top 5 Pizza theo Tổng số đơn hàng
SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

-- L. Bottom 5 Pizza theo Tổng số đơn hàng
SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;

