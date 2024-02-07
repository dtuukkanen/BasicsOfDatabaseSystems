CREATE INDEX playerid_index ON Player(playerid);
CREATE INDEX playerOne_index ON Matches(FK_playerOne);
CREATE INDEX playerTwo_index ON Matches(FK_playerTwo);
CREATE INDEX winnerID_index ON Matches(winnerID);
CREATE INDEX FK_playerid_index ON Ranking(FK_playerid);

SELECT * FROM Player 
    INNER JOIN Ranking ON Player.playerid = Ranking.FK_playerid
    WHERE (SELECT COUNT (*) FROM Matches 
        WHERE (Player.playerid = Matches.FK_playerOne OR Player.playerid = Matches.FK_playerTwo) )/2 = 
        (SELECT COUNT (*) FROM Matches WHERE (Player.playerid = Matches.winnerID));