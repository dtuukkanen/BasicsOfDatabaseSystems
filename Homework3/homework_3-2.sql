CREATE TABLE User (
    UserID INT NOT NULL PRIMARY KEY,
    Username VARCHAR(50),
    Verified VARCHAR(10),
    Followers INT
);

CREATE TABLE Tweet (
    TweetID INT NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    Content VARCHAR(200),
    FOREIGN KEY(UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

CREATE TABLE Comments (
    CommentID INT NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    TweetID,
    FK_CommentID,
    Content VARCHAR(200),
    FOREIGN KEY(UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY(TweetID) REFERENCES Tweet(TweetID) ON DELETE CASCADE,
    FOREIGN KEY(FK_CommentID) REFERENCES Comments(CommentID) ON DELETE CASCADE
);

CREATE TABLE Hashtag (
    HashtagID INT PRIMARY KEY,
    Content VARCHAR(50)
);

CREATE TABLE HashtagsInContent (
    HashtagID INT NOT NULL,
    TweetID INT,
    CommentID INT,
    FOREIGN KEY(HashtagID) REFERENCES Hashtag(HashtagID) ON DELETE CASCADE,
    FOREIGN KEY(TweetID) REFERENCES Tweet(TweetID) ON DELETE CASCADE,
    FOREIGN KEY(CommentID) REFERENCES Comments(CommentID) ON DELETE CASCADE
);

CREATE TABLE Likes (
    LikeID INT NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    TweetID INT,
    CommentID INT,
    FOREIGN KEY(UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY(TweetID) REFERENCES Tweet(TweetID) ON DELETE CASCADE,
    FOREIGN KEY(CommentID) REFERENCES Comments(CommentID) ON DELETE CASCADE
);
