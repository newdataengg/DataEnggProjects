SELECT 
    *
FROM
    euro_cup_2016.player_mast
WHERE
    team_id = (SELECT 
            country_id
        FROM
            euro_cup_2016.soccer_country
        WHERE
            country_name = 'England')
        AND playing_club = 'Liverpool';