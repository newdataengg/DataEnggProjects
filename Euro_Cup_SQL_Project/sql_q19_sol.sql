SELECT 
    COUNT(DISTINCT player_gk) AS total_captains_gk
FROM
    euro_cup_2016.match_details md
WHERE
    EXISTS( SELECT 
            1
        FROM
            euro_cup_2016.match_captain mc
        WHERE
            mc.match_no = md.match_no
                AND mc.team_id = md.team_id
                AND mc.player_captain = md.player_gk);