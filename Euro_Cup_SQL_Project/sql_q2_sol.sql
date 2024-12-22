SELECT 
    COUNT(*) AS match_won_by_penalty
FROM
    euro_cup_2016.match_details
WHERE
    win_lose = 'W' AND decided_by = 'P';