SELECT * FROM (
    SELECT Player.*, Ranking.*
    FROM Player
    JOIN Ranking ON Player.PlayerID = Ranking.FK_playerid 
    ORDER BY Ranking.rank 
    LIMIT 10
) ORDER BY playerid