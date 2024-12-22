-- Since goal_details table is used, no goals scenario will not be there
SELECT 
    sc.country_name,
    (SELECT 
            pp.position_desc
        FROM
            euro_cup_2016.playing_position pp
        WHERE
            pp.position_id = pd.posi_to_play) position_name,
    COUNT(*) AS total_goals
FROM
    euro_cup_2016.goal_details gd,
    euro_cup_2016.player_mast pd,
    euro_cup_2016.soccer_country sc
WHERE
    gd.player_id = pd.player_id
        AND pd.team_id = sc.country_id
GROUP BY sc.country_name , pd.posi_to_play
ORDER BY 1 , 2;