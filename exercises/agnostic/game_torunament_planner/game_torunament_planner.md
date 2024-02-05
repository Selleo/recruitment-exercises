## Create a board games tournament planner

There is a board games day scheduled and organizers would like to automatically get a list of all game tournaments & players that will take place during that day according to the preference of the attendees.

The organizers have created an online poll where attendees could select multiple game titles they would like to play that day. The data have already been collected and is represented through class `Player`. One player has a name and can have multiple `games` associated with him/her (these are the games that the player would like to play) and the `sign_up_at` timestamp (when player sent the poll).

There is needed of course another class for `Game` which would only consist of `name`, `priority` (integer from range 1-10, signifies in what order the games should be considered for tournaments, the higher the priority the game should be taken first) and `max_players_count` (for this task let’s assume that the game's players count needs to be between 2 (min) and `max_players_count` (max) to host a tournament for that game).

Another class would be `GameTournament` which would have game and list of players that will be playing it that day.

Finally we need class `TournamentPlanner` which is initialized with array of `Players` and `Games`. It creates new instances of `GameTournament` objects when public method `#plan_tournaments` is called on it. It will determine all games that were chosen by players and sort them by descending priority and will identify if there is required amount of players for each of them, then for those that fulfill the requirement it will create `GameTournament` object.

The day will consist of multiple tournaments. However each game can only be played once during the day. The tournament for a game can only take place if there is required amount of players that would like to play the game. One player might take part in one tournament since they will be held in parallel. When adding players to a tournament you need to check if the player is not already taking part in some other tournament created earlier.

## Tasks

* Create a Ruby/Typescript script that implements aforementioned classes.
* Prepare some example data for possible `Players` and `Games`.
* Implement planning logic for `TournamentPlanner` taking into account the rules and constraints.
* Prints out final game turnaments schedule (each row consists of Game name, list of player names). Consider implementing `#to_s` method of each class to simplify printing.
* Also print out list of `Games` that were excluded (no one wanted to play them, they didn't have required amount of minimal players or their ranking was low and players were allocated to games with higher ranking)
