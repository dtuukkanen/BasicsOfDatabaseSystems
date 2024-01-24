CREATE TRIGGER hashtag_not_allowed BEFORE INSERT ON Hashtag
WHEN NEW.Content LIKE '%#mayonnaise%'
BEGIN
    SELECT RAISE(ABORT, 'Mayonnaise detected!');
END;
