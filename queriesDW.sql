/*Query1:-*/
SELECT suppliers.SUPPLIER_NAME, timeperiod.QUARTER, timeperiod.MONTH,products.PRODUCT_NAME,SUM(TOTAL_SALES) 
from sales 
join products on products.PRODUCT_ID = sales.PRODUCT_ID
join suppliers on sales.SUPPLIER_ID = suppliers.SUPPLIER_ID
join timeperiod on sales.TIME_ID = timeperiod.TIME_ID
GROUP BY SUPPLIER_NAME,timeperiod.QUARTER,timeperiod.MONTH,PRODUCT_NAME;


/*Query3:-*/
SELECT sales.PRODUCT_ID,products.PRODUCT_NAME, SUM(QUANTITY)
from sales
JOIN products 
ON sales.PRODUCT_ID = products.PRODUCT_ID
JOIN timeperiod
ON sales.TIME_ID = timeperiod.TIME_ID
WHERE timeperiod.isWEEKEND = 1 
GROUP BY PRODUCT_NAME
ORDER BY SUM(QUANTITY) DESC
LIMIT 5;

/*Query4:-*/
SELECT sums.PRODUCT_ID,sums.PRODUCT_NAME, sums.Q1 As 'Quarter 1', sums.Q2 As 'Quarter 2', sums.Q3 As 'Quarter 3', sums.Q4 As 'Quarter 4', (sums.Q1 + sums.Q2 + sums.Q3 + sums.Q4) as yearlySales
	from (SELECT sales.PRODUCT_ID, products.PRODUCT_NAME,
    SUM( IF(timeperiod.QUARTER = 1,sales.TOTAL_SALES,0) ) As 'Q1',
    SUM( IF(timeperiod.QUARTER = 2,sales.TOTAL_SALES,0) ) As 'Q2',
    SUM( IF(timeperiod.QUARTER = 3,sales.TOTAL_SALES,0) ) As 'Q3',
    SUM( IF(timeperiod.QUARTER = 4,sales.TOTAL_SALES,0) ) As 'Q4'
	FROM timeperiod
	JOIN sales
	ON sales.SALE_ID = timeperiod.TIME_ID
    JOIN products 
    ON products.PRODUCT_ID = sales.PRODUCT_ID
    WHERE timeperiod.YEAR = 2016
	GROUP BY sales.PRODUCT_ID
	ORDER BY sales.PRODUCT_ID ASC) AS sums;
    
/*Query7:-*/

drop view if exists STOREANALYSIS_MV;
CREATE VIEW STOREANALYSIS_MV AS
SELECT sales.STORE_ID, sales.PRODUCT_ID as PROD_ID , SUM(TOTAL_SALES) as STORE_TOTAL
FROM sales
GROUP BY sales.STORE_ID,sales.PRODUCT_ID
ORDER BY sales.STORE_ID ASC;

SELECT * from STOREANALYSIS_MV;
