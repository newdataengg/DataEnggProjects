SELECT 
    rm.referee_name,
    COUNT(DISTINCT player_id) AS highest_player_booked
FROM
    euro_cup_2016.player_booked pb,
    euro_cup_2016.match_mast mm,
    euro_cup_2016.referee_mast rm
WHERE
    pb.match_no = mm.match_no
        AND mm.referee_id = rm.referee_id
GROUP BY rm.referee_name
ORDER BY highest_player_booked DESC
LIMIT 1;