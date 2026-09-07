SET SERVEROUTPUT ON;

BEGIN

    -- Update the description of one delivery.
    UPDATE DELIVERY_ITEM
    SET DESCRIPTION = 'House relocation'
    WHERE DELIVERY_ITEM_ID = 71011;

    -- SQL%ROWCOUNT tells us how many rows were affected.
    DBMS_OUTPUT.PUT_LINE(
        'Number of delivery records updated: ' || SQL%ROWCOUNT
    );

END;
/

SET SERVEROUTPUT ON;

DECLARE

    -- Create an explicit cursor to find the staff member
    -- with Staff ID 51014.
    CURSOR staff_cursor IS
        SELECT STAFF_ID, FIRST_NAME, SURNAME
        FROM STAFF
        WHERE STAFF_ID = 51014;

    v_staff_id STAFF.STAFF_ID%TYPE;
    v_first_name STAFF.FIRST_NAME%TYPE;
    v_surname STAFF.SURNAME%TYPE;

BEGIN

    -- Open the cursor so Oracle can execute the query.
    OPEN staff_cursor;

    -- Retrieve the record returned by the cursor.
    FETCH staff_cursor
    INTO v_staff_id, v_first_name, v_surname;

    -- %FOUND checks whether the FETCH successfully found a record.
    IF staff_cursor%FOUND THEN

        DBMS_OUTPUT.PUT_LINE(
            'Staff member found: ' ||
            v_staff_id || ' - ' ||
            v_first_name || ' ' ||
            v_surname
        );

    ELSE

        DBMS_OUTPUT.PUT_LINE(
            'No staff member was found.'
        );

    END IF;

    -- Close the cursor after the record has been processed.
    CLOSE staff_cursor;

END;
/