create or replace procedure check_account(account_id_in IN account_test.id%TYPE)
IS
    l_balance_remaining	NUMBER;
	l_balance_below_minimum	EXCEPTION;
	l_account_name		account_test.name%TYPE;
begin
  SELECT name INTO l_account_name FROM account_test
        WHERE id = account_id_in;
    
    l_balance_remaining := account_balance(account_id_in);

    DBMS_OUTPUT.PUT_LINE(
        'Balance for ' || l_account_name ||
        ' = ' || l_balance_remaining);

    IF l_balance_remaining < 1000
    THEN
        RAISE l_balance_below_minimum;
	END IF;

EXCEPTION
	WHEN NO_DATA_FOUND
	THEN
		-- No account found for this ID
		DBMS_OUTPUT.put_line('No account found for this ID: ' || account_id_in);

	WHEN l_balance_below_minimum
	THEN
		DBMS_OUTPUT.put_line('The ID: ' || account_id_in || ' is less than 1000');
		RAISE;
end check_account;
/
