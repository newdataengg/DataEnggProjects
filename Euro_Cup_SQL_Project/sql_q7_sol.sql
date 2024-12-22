SELECT 
    venue_name AS penalty_match_venue
FROM
    euro_cup_2016.soccer_venue
WHERE
    venue_id IN (SELECT 
            venue_id
        FROM
            euro_cup_2016.match_mast
        WHERE
            decided_by = 'P');