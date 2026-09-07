CREATE OR REPLACE VIEW VW_STAFF_DELIVERY_REPORT AS
SELECT
    s.STAFF_ID,
    s.FIRST_NAME,
    s.SURNAME,
    COUNT(di.DELIVERY_ITEM_ID) AS DELIVERIES_PROCESSED
FROM STAFF s
JOIN DELIVERY_ITEM di
    ON s.STAFF_ID = di.STAFF_ID
GROUP BY
    s.STAFF_ID,
    s.FIRST_NAME,
    s.SURNAME;
    
    SELECT * 
    FROM VW_STAFF_DELIVERY_REPORT
    ORDER BY DELIVERIES_PROCESSED DESC;
    
    SELECT
    STAFF_ID,
    FIRST_NAME,
    SURNAME,
    DELIVERIES_PROCESSED
FROM VW_STAFF_DELIVERY_REPORT
ORDER BY DELIVERIES_PROCESSED DESC
FETCH FIRST 1 ROW ONLY;

-- The manager can use this simple query to see the staff
-- member who processed the greatest number of deliveries.

SELECT
    STAFF_ID,
    FIRST_NAME,
    SURNAME,
    DELIVERIES_PROCESSED
FROM VW_STAFF_DELIVERY_REPORT

-- Put the staff member with the highest number of deliveries first.
ORDER BY DELIVERIES_PROCESSED DESC

-- Only display the highest result.
FETCH FIRST 1 ROW ONLY;