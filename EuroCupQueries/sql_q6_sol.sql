SELECT 
    COUNT(*) AS total_matches_by_single_points
FROM
    euro_cup_2016.match_details md1,
    euro_cup_2016.match_details md2
WHERE
    md1.match_no = md2.match_no
        AND md1.win_lose <> md2.win_lose
        AND md1.decided_by <> 'P'
        AND md1.win_lose IN ('L' , 'W')
        AND md2.win_lose IN ('L' , 'W')
        AND md1.goal_score <= md2.goal_score -- This is to remove duplicates
        AND ABS(md1.goal_score - md2.goal_score) = 1;
