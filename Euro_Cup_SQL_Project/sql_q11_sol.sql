SELECT 
    pm.player_name, pm.jersey_no, pm.playing_club
FROM
    euro_cup_2016.player_mast pm
WHERE
    team_id = (SELECT 
            country_id
        FROM
            euro_cup_2016.soccer_country
        WHERE
            country_name = 'England')
        AND EXISTS( SELECT 
            1
        FROM
            euro_cup_2016.match_details md
        WHERE
            md.player_gk = pm.player_id);