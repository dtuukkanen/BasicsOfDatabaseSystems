CREATE TABLE User (
    UserID INT NOT NULL PRIMARY KEY,
    Username VARCHAR(50),
    Verified VARCHAR(10),
    Followers INT
);

CREATE TABLE Tweet (
    TweetID INT PRIMARY KEY,
    UserID INT,
    Content VARCHAR(200),
    FOREIGN KEY(UserID) REFERENCES User(UserID)
);

CREATE TABLE Comments (
    CommentID INT NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    TweetID INT,
    FK_CommentID INT,
    Content VARCHAR(200),
    FOREIGN KEY(UserID) REFERENCES User(UserID),
    FOREIGN KEY(TweetID) REFERENCES Tweet(TweetID),
    FOREIGN KEY(FK_CommentID) REFERENCES Comments(CommentID)
);

CREATE TABLE Hashtag (
    HashtagID INT NOT NULL PRIMARY KEY,
    Content VARCHAR(50)
);

CREATE TABLE HashtagsInContent (
    HashtagID INT NOT NULL,
    TweetID INT,
    CommentID INT,
    FOREIGN KEY(HashtagID) REFERENCES Hashtag(HashtagID),
    FOREIGN KEY(TweetID) REFERENCES Tweet(TweetID),
    FOREIGN KEY(CommentID) REFERENCES Comments(CommentID)
);

CREATE TABLE Likes (
    LikeID INT NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    TweetID INT,
    CommentID INT,
    FOREIGN KEY(UserID) REFERENCES User(UserID),
    FOREIGN KEY(TweetID) REFERENCES Tweet(TweetID),
    FOREIGN KEY(CommentID) REFERENCES Comments(CommentID)
);