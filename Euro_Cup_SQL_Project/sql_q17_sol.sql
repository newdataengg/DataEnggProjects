SELECT 
    sc.country_name,
    COUNT(DISTINCT md.ass_ref) AS number_asst_ref
FROM
    euro_cup_2016.match_details md,
    euro_cup_2016.asst_referee_mast arm,
    euro_cup_2016.soccer_country sc
WHERE
    md.ass_ref = arm.ass_ref_id
        AND arm.country_id = sc.country_id
GROUP BY sc.country_name
ORDER BY number_asst_ref DESC
LIMIT 1;