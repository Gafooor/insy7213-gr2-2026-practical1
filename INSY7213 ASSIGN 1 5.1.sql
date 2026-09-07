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
    s.SURNAME
ORDER BY COUNT(di.DELIVERY_ITEM_ID) DESC
FETCH FIRST 1 ROW ONLY;

SET SERVEROUTPUT ON;

DECLARE
    v_staff_id NUMBER;
    v_first_name VARCHAR2(50);
    v_surname VARCHAR2(50);
    v_delivery_count NUMBER;
BEGIN

    SELECT
        s.STAFF_ID,
        s.FIRST_NAME,
        s.SURNAME,
        COUNT(di.DELIVERY_ITEM_ID)
    INTO
        v_staff_id,
        v_first_name,
        v_surname,
        v_delivery_count
    FROM STAFF s
    JOIN DELIVERY_ITEM di
        ON s.STAFF_ID = di.STAFF_ID
    GROUP BY
        s.STAFF_ID,
        s.FIRST_NAME,
        s.SURNAME
    ORDER BY COUNT(di.DELIVERY_ITEM_ID) DESC
    FETCH FIRST 1 ROW ONLY;

    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('STAFF ID: ' || v_staff_id);
    DBMS_OUTPUT.PUT_LINE('FIRST NAME: ' || v_first_name);
    DBMS_OUTPUT.PUT_LINE('SURNAME: ' || v_surname);
    DBMS_OUTPUT.PUT_LINE('DELIVERIES PROCESSED: ' || v_delivery_count);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');

END;
/