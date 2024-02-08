.headers on

SELECT 
    winner.first_name || ' ' || winner.last_name AS "Winner name", 
    winner_rank.rank AS "Winner rank", 
    loser.first_name || ' ' || loser.last_name AS "Loser name", 
    loser_rank.rank AS "Loser rank", 
    m.matchdate AS "Matchdate"
FROM Matches m
JOIN Player winner ON m.winnerID = winner.playerid
JOIN Player loser ON m.FK_playerOne = loser.playerid OR m.FK_playerTwo = loser.playerid
JOIN Ranking winner_rank ON winner.playerid = winner_rank.FK_playerid
JOIN Ranking loser_rank ON loser.playerid = loser_rank.FK_playerid
WHERE loser_rank.rank <= 5 AND winner.playerid != loser.playerid
ORDER BY winner_rank.rank;