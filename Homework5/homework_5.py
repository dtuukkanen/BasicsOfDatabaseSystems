####################################################
############## Do not touch this part ##############
import sqlite3
db = sqlite3.connect('hw5tennis.db')
cur = db.cursor()
def initializeDB():
    try:
        f = open("sqlcommands.sql", "r")
        commandstring = ""
        for line in f.readlines():
            commandstring+=line
        cur.executescript(commandstring)
    except sqlite3.OperationalError:
        print("Database exists, skip initialization")
    except:
        print("No SQL file to be used for initialization") 


def main():
    initializeDB()
    userInput = -1
    while(userInput != "0"):
        print("\nMenu options:")
        print("1: Print Players")
        print("2: Print Ranking")
        print("3: Print Matches")
        print("4: Search for one player")
        print("5: Move matchdate")
        print("6: Delete player")
        print("0: Quit")
        userInput = input("What do you want to do? ")
        print(userInput)
        if userInput == "1":
            printPlayers()
        if userInput == "2":
            printRanking()
        if userInput == "3":
            printMatches()
        if userInput == "4":
            searchPlayer()
        if userInput == "5":
            moveMatch()
        if userInput == "6":
            deletePlayer()
        if userInput == "0":
            print("Ending software...")
    db.close()        
    return

############## Do not touch part ends ##############
####################################################


############## Please modify the following ##############
def printPlayers():
    print("Printing players")
    """
    Insert the correct Python and SQL commands
    to print all players
    """
    #Start your modifications after this comment
    #You should print the data noe row at a time.
    cur.execute("SELECT * FROM player")
    players = cur.fetchall()
    for player in players:
        print(player)
    return

def printRanking():
    print("Printing ranking")
    """
    Insert the correct Python and SQL commands 
    to print all ranking information
    """
    #Start your modifications after this comment
    #You should print the data noe row at a time.
    cur.execute("SELECT * FROM ranking")
    rankings = cur.fetchall()
    for ranking in rankings:
        print(ranking)
    return

def printMatches():
    print("Printing matches")
    """ 
    Insert the correct Python and SQL commands 
    to print all ranking information
    """
    #Start your modifications after this comment
    #You should print the data one row at a time.
    cur.execute("SELECT * FROM matches")
    matches = cur.fetchall()
    for match in matches:
        print(match)
    return

def searchPlayer():
    playerName = input("What is the player's surname? ")
    """ 
    Insert the correct Python and SQL commands to find the player 
    using the given surname
    """
    #Start your modifications after this comment
    #You are given the print statements, now you need to add the fetched data to the five prints.
    cur.execute("SELECT * FROM player WHERE last_name = ?", (playerName,))
    player = cur.fetchone()
    
    print("ID: " + str(player[0]))
    print("First name: " + str(player[1]))
    print("Last name: " + str(player[2]))
    print("Birthdate: " + str(player[4]))
    print("Nationality: " + str(player[3]))
    return

def moveMatch():
    matchID = input("What is the matchID of the match you want to move? ")
    newMatchDate = input ("What is the new matchdate you want to set?")
    
    """ 
    Using the correct Python and SQL comands:
    Change the match date based on the given matchID and new matchdate
    IF a new matchdate is set to NULL, set the winner and result to NULL as well
    """
    #Start your modifications after this comment
    # If match date is null, set winner and result to null
    if newMatchDate == "NULL":
        cur.execute("UPDATE matches SET matchdate = ?, winnerID = ?, resultSets = ? WHERE matchid = ?", (None, None, None, matchID))
    else:
        cur.execute("UPDATE matches SET matchdate = ? WHERE matchid = ?", (newMatchDate, matchID))
    db.commit()
    return

def deletePlayer():
    playerID = input("What is the player's PlayerID? ")
    """ 
    Using the correct Python and SQL comands:
    Delete the Player and his Ranking information
    Additionally, set the playerid to NULL in ALL match-data it is found
    """
    #Start your modifications after this comment
    cur.execute("DELETE FROM player WHERE playerid = ?", (playerID,))
    cur.execute("DELETE FROM ranking WHERE FK_playerid = ?", (playerID,))
    cur.execute("UPDATE matches SET FK_playerOne = ? WHERE FK_playerOne = ?", (None, playerID))
    cur.execute("UPDATE matches SET FK_playerTwo = ? WHERE FK_playerTwo = ?", (None, playerID))
    cur.execute("UPDATE matches SET winnerID = ? WHERE winnerID = ?", (None, playerID))

main()