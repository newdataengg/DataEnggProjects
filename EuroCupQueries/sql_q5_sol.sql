SELECT 
    COUNT(*) AS number_bookings
FROM
    euro_cup_2016.player_booked
WHERE
    match_no IN (SELECT 
            match_no
        FROM
            euro_cup_2016.match_mast
        WHERE
            (stop1_sec <> 0 OR stop2_sec <> 0));