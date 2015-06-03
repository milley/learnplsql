DECLARE
	l_book_count INTEGER;
BEGIN
	SELECT COUNT(*)
		INTO l_book_count
		FROM books
		WHERE author LIKE '%FEUERSTEIN, STEVEN%';

	DBMS_OUTPUT.PUT_LINE(
		'Steven has written (or co-written) ' ||
		l_book_count ||
		' books.');

	-- Oh, and I changed my name, so...
	UPDATE books SET author = REPLACE(author, 'STEVEN', 'STEPHEN')
		WHERE author LIKE '%FEUERSTEIN, STEVEN%';
END;
