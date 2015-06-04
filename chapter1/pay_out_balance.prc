create or replace procedure pay_out_balance(account_id_in in account_test.id%TYPE) IS
    l_balance_remaining NUMBER;
begin
    LOOP
        l_balance_remaining := account_balance(account_id_in);
        IF l_balance_remaining < 1000
		THEN
			EXIT;
		ELSE
			accept_balance(account_id_in, l_balance_remaining);
            EXIT;
		END IF;
	END LOOP;
end pay_out_balance;
/
