SELECT 
    pm.player_name, sc.country_name
FROM
    euro_cup_2016.goal_details gd,
    euro_cup_2016.player_mast pm,
    euro_cup_2016.soccer_country sc
WHERE
    gd.player_id = pm.player_id
        AND pm.posi_to_play = 'FD'
        AND pm.team_id = sc.country_id;