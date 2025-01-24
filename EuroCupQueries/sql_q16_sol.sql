SELECT 
    rm.referee_name, sv.venue_name, COUNT(*) AS total_matches
FROM
    euro_cup_2016.match_mast mm,
    euro_cup_2016.referee_mast rm,
    euro_cup_2016.soccer_venue sv
WHERE
    rm.referee_id = mm.referee_id
        AND mm.venue_id = sv.venue_id
GROUP BY rm.referee_name , sv.venue_name;