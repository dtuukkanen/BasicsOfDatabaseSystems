.headers on

SELECT 
    p1.first_name || ' ' || p1.last_name AS "Player one", 
    p2.first_name || ' ' || p2.last_name AS "Player two", 
    m.matchdate AS "Matchdate", 
    (SELECT first_name || ' ' || last_name FROM Player WHERE playerid = m.winnerID) AS "Winner"
FROM 
    Matches m
INNER JOIN 
    Player p1 ON m.FK_playerOne = p1.playerid
INNER JOIN 
    Player p2 ON m.FK_playerTwo = p2.playerid
WHERE 
    EXISTS (
        SELECT 1
        FROM Matches m2
        WHERE ((m2.FK_playerOne = m.FK_playerOne AND m2.FK_playerTwo = m.FK_playerTwo) OR
               (m2.FK_playerOne = m.FK_playerTwo AND m2.FK_playerTwo = m.FK_playerOne)) AND
              m2.matchid <> m.matchid
    )
ORDER BY 
    "Winner", m.matchid;