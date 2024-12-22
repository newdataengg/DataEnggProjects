SELECT 
    player_name, jersey_no
FROM
    euro_cup_2016.player_mast pm
WHERE
    team_id = (SELECT 
            country_id
        FROM
            euro_cup_2016.soccer_country
        WHERE
            country_name = 'Germany')
        AND EXISTS( SELECT 
            1
        FROM
            euro_cup_2016.match_details md
        WHERE
            md.play_stage = 'G'
                AND md.player_gk = pm.player_id);