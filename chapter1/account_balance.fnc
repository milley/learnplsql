create or replace function account_balance(account_id_in in number) return number is
  Result number;
begin
  SELECT salary INTO RESULT FROM account_test WHERE id = account_id_in;
  return(Result);
end account_balance;
/
