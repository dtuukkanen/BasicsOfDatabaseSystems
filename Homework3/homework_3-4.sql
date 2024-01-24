CREATE VIEW Comments_of_comments AS
SELECT User.Username as 'User', Comments.Content as 'Comment', CommentedOn.CommentID as 'Commented on'
FROM USER
JOIN Comments ON User.UserID = Comments.UserID
JOIN Comments as CommentedOn ON Comments.FK_CommentID = CommentedOn.CommentID
ORDER BY User.Username;