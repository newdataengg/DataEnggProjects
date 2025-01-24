SELECT 
    mm.match_no,
    mm.play_date,
    CONCAT(md1.goal_score, '-', md2.goal_score) AS goal_score
FROM
    euro_cup_2016.match_mast mm,
    euro_cup_2016.match_details md1,
    euro_cup_2016.match_details md2
WHERE
    mm.stop1_sec = 0
        AND md1.match_no = mm.match_no
        AND md2.match_no = mm.match_no
        AND md1.team_id < md2.team_id; -- This is to select 1 row for a match