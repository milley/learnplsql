PROCEDURE pay_out_balance (
	account_id_in IS account.id%TYPE)
IS
	l_balance_remaining NUMBER;
BEGIN
	LOOP
		l_balance_remaining := account_balance(account_id_in);
		IF l_balance_remaining < 1000
		THEN
			EXIT;
		ELSE
			apply_balance(account_id_in, l_balance_remaining);
		END IF;
	END LOOP;
END pay_out_balance;