PROCEDURE check_account(
	account_id_in IN account.id%TYPE)
IS
	l_balance_remaining	NUMBER;
	l_balance_below_minimum	EXCEPTION;
	l_account_name		account.name%TYPE;
BEGIN
	SELECT name INTO l_account_name FROM account
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
		log_error(...);

	WHEN l_balance_below_minimum
	THEN
		log_error(...);
		RAISE;

END;
