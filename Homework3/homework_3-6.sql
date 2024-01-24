CREATE VIEW Tweets_and_tags AS
SELECT User.Username as 'User', Tweet.Content as 'Tweet', GROUP_CONCAT(Hashtag.Content, '') as 'Hashtag'
FROM User
JOIN Tweet ON User.UserID = Tweet.UserID
JOIN HashtagsInContent ON Tweet.TweetID = HashtagsInContent.TweetID
JOIN Hashtag ON HashtagsInContent.HashtagID = Hashtag.HashtagID
GROUP BY User.Username, Tweet.Content
ORDER BY User.Username;