SELECT 
    high_p.match_no,
    high_p.highest_penalty_count,
    scy.country_name,
    sc.city,
    sv.venue_name
FROM
    (SELECT 
        match_no, COUNT(*) AS highest_penalty_count
    FROM
        euro_cup_2016.penalty_shootout
    GROUP BY match_no
    ORDER BY highest_penalty_count DESC
    LIMIT 1) high_p,
    euro_cup_2016.match_mast mm,
    euro_cup_2016.soccer_venue sv,
    euro_cup_2016.soccer_city sc,
    euro_cup_2016.soccer_country scy
WHERE
    high_p.match_no = mm.match_no
        AND mm.venue_id = sv.venue_id
        AND sv.city_id = sc.city_id
        AND sc.country_id = scy.country_id;