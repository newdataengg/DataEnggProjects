SELECT 
    rm.referee_name, COUNT(*) AS total_bookings
FROM
    euro_cup_2016.player_booked pb,
    euro_cup_2016.match_mast mm,
    euro_cup_2016.referee_mast rm
WHERE
    pb.match_no = mm.match_no
        AND mm.referee_id = rm.referee_id
GROUP BY rm.referee_name
ORDER BY total_bookings DESC;