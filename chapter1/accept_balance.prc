create or replace procedure accept_balance(account_id_in in number,l_balance_remaining in number) is
begin
  UPDATE account_test SET salary = (l_balance_remaining + 50) WHERE id = account_id_in;
  DBMS_OUTPUT.put_line('call accept balance successful!');
  COMMIT;
end accept_balance;
/
