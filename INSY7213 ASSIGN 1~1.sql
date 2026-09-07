SET SERVEROUTPUT ON;

DECLARE
    CURSOR driver_cursor IS
        SELECT
            d.FIRST_NAME,
            d.SURNAME,
            d.DRIVER_CODE,
            dd.VIN_NUMBER,
            v.MILEAGE
        FROM DRIVER d
        JOIN DRIVER_DELIVERIES dd
            ON d.DRIVER_ID = dd.DRIVER_ID
        JOIN VEHICLE v
            ON dd.VIN_NUMBER = v.VIN_NUMBER
        WHERE v.MILEAGE < 80000;

BEGIN
    FOR rec IN driver_cursor LOOP

        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('DRIVER: ' || rec.FIRST_NAME || ', ' || rec.SURNAME);
        DBMS_OUTPUT.PUT_LINE('CODE: ' || rec.DRIVER_CODE);
        DBMS_OUTPUT.PUT_LINE('VIN NUMBER: ' || rec.VIN_NUMBER);
        DBMS_OUTPUT.PUT_LINE('MILEAGE: ' || rec.MILEAGE);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');

    END LOOP;
END;
/