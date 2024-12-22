WITH high_booking AS (SELECT 
    match_no, COUNT(*) AS highest_booked
FROM
    euro_cup_2016.player_booked
GROUP BY match_no
ORDER BY highest_booked DESC) 
SELECT highest_booked 
FROM high_booking
LIMIT 1;