SELECT*
FROM BRIGHTLIGHT.COFFEE_SHOP.SALES;

SELECT
Min(transaction_time)
FROM brightlight.coffee_shop.sales;

SELECT
Max(transaction_time)
FROM brightlight.coffee_shop.sales;


 SELECT Product_category,
        Product_type,
        Product_detail,
        Store_location,
        Transaction_qty,
        
TO_DATE(TRANSACTION_DATE) AS TRANSACTION_DATE,
DAYNAME(TO_DATE(TRANSACTION_DATE)) AS DAY_NAME,
MONTHNAME(TO_DATE(TRANSACTION_DATE)) AS MONTH_NAME,
DAYOFMONTH(TO_DATE(TRANSACTION_DATE)) AS DAY_OF_MONTH,
TO_CHAR(TO_DATE(TRANSACTION_DATE),'YYYY MM') AS YEAR_MONTH,
SUM(UNIT_PRICE*TRANSACTION_QTY) AS REVENUE,

CASE WHEN transaction_time between '06:00:00' and '11:59:00' then 'Morning'
     WHEN transaction_time between '12:00:00' and '16:59:00' then 'Afternoon'
     WHEN transaction_time between '17:00:00' and '19:00:00' then 'Evening'
     Else 'Night'
     END As Time_buckets,

CASE WHEN day_name NOT IN ('Sat','Sun') THEN 'Weekday'
ELSE 'Weekend'
END AS DAY_CATEGORY,

Count(DISTINCT STORE_ID) AS STORE_ID,
count(DISTINCT PRODUCT_ID) AS PRODUCT_ID,
COUNT(DISTINCT TRANSACTION_ID) AS TRANSACTION_ID

FROM BRIGHTLIGHT.COFFEE_SHOP.SALES
GROUP BY ALL;
